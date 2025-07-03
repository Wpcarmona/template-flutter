import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/config/constants/app_keys.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/domain/repositories/repository.dart';
import 'package:app_template/infraestructure/repositories/repositories_infraestructure.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service_impl.dart';
import 'package:app_template/presentation/utils/dio_exception_handler.dart';

enum ParticipantStatus {
  initial,
  loading,
  success,
  error,
}

final participantProvider =
    StateNotifierProvider<ParticipantNotifier, ParticipantState>((ref) {
  final participantRepository = PariticipantRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return ParticipantNotifier(
    ref: ref,
    participantRepository: participantRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class ParticipantNotifier extends StateNotifier<ParticipantState> {
  final Ref ref;
  final ParticipantRepository participantRepository;
  final KeyValueStorageService keyValueStorageService;

  ParticipantNotifier({
    required this.ref,
    required this.participantRepository,
    required this.keyValueStorageService,
  }) : super(ParticipantState());

  Future<void> getInfoPublicUser() async {
    try {
      final token =
          await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token != null) {
        final publicInfoUser =
            await participantRepository.participantPublicInfo(token: token);
        _setPublicInfoUser(publicInfoUser.info);
      }
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(errorMessage: message);
      }, ref);
    }
  }

  Future<void> findParticipantWithTags(List<String> tags) async {
    try {
      final token =
          await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      state = state.copyWith(status: ParticipantStatus.loading);
      await participantRepository
          .findParticipantWithTags(token: token, withAdmin: true, tags: tags);
      
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, status: ParticipantStatus.error);
      }, ref);
    }
  }

  void _setPublicInfoUser(PublicInfoUser publicInfoUser) async {
    await keyValueStorageService.setKeyValue(
        AppKeys.publicUserInfo,
        jsonEncode({
          'points': publicInfoUser.points,
          'totalPoints': publicInfoUser.totalPoints,
          'coins': publicInfoUser.coins,
          'totalCoins': publicInfoUser.totalCoins,
          'tags': publicInfoUser.tags
        }));

    final resTag = publicInfoUser.tags.firstWhere(
      (tag) => tag.startsWith('res:'),
      orElse: () => '',
    );
    if (resTag.isNotEmpty) {
      await findParticipantWithTags([resTag]);
    }
  }

  Future<void> updateUserTag(List<String> tags) async {
    try {
      final token =
          await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      final userInfo =
          await keyValueStorageService.getValue<String>(AppKeys.userInfo);
      if (userInfo == null) return;
      final uidUser = jsonDecode(userInfo)['uid'];
      state = state.copyWith(status: ParticipantStatus.loading);
      await participantRepository.updateTags(
          token: token, distinctId: uidUser, tags: tags);
      state = state.copyWith(status: ParticipantStatus.success);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(errorMessage: message);
      }, ref);
    }
  }
}

class ParticipantState {
  final ParticipantStatus status;
  final FindParticipantWithTags? findParticipantWithTags;
  final String? errorMessage;

  ParticipantState({
    this.status = ParticipantStatus.initial,
    this.findParticipantWithTags,
    this.errorMessage,
  });

  ParticipantState copyWith({
    ParticipantStatus? status,
    FindParticipantWithTags? findParticipantWithTags,
    String? errorMessage,
  }) =>
      ParticipantState(
        status: status ?? this.status,
        findParticipantWithTags:
            findParticipantWithTags ?? this.findParticipantWithTags,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
