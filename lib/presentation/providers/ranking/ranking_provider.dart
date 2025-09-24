import 'dart:convert';

import 'package:app_template/infraestructure/infraestructure.dart';
import 'package:app_template/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/config/config.dart';
import 'package:app_template/domain/domain.dart';
import 'package:dio/dio.dart';

enum RankingStatus {
  initial,
  loading,
  loaded,
  error,
}

final rankingProvider =
    StateNotifierProvider<RankingNotifier, RankingState>((ref) {
  final rankingRepository = RankingRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return RankingNotifier(
    ref: ref,
    rankingRepository: rankingRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class RankingNotifier extends StateNotifier<RankingState> {
  final Ref ref;
  final RankingRepository rankingRepository;
  final KeyValueStorageService keyValueStorageService;

  RankingNotifier({
    required this.ref,
    required this.rankingRepository,
    required this.keyValueStorageService,
  }) : super(RankingState());

  Future<void> getParticipantRanking() async {
    try {
      state = state.copyWith(status: RankingStatus.loading);
      final userInfo =
          await keyValueStorageService.getValue<String>(AppKeys.userInfo);
      if (userInfo == null) return;
      final decodedUserInfo = jsonDecode(userInfo);
      final uidUser = decodedUserInfo['uid'];

      final participantRanking = await rankingRepository.getParticipantRanking(
        apiKey: Environment.apiKey,
        campaign: Environment.campaign,
        distinctId: uidUser,
      );

      state = state.copyWith(
        status: RankingStatus.loaded,
        participantRanking: participantRanking,
      );
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
          errorMessage: message,
          status: RankingStatus.error,
        );
      }, ref);
    }
  }

  Future<void> getRankings() async {
    try {
      state = state.copyWith(status: RankingStatus.loading);
     final userInfo =
          await keyValueStorageService.getValue<String>(AppKeys.userInfo);
    final participantInfo =
          await keyValueStorageService.getValue<String>(AppKeys.publicUserInfo);
      if (userInfo == null || participantInfo == null) return;
      final decodedUserInfo = jsonDecode(userInfo);
      final decodedParticipantInfo = jsonDecode(participantInfo);
      final uidUser = decodedUserInfo['uid'];
      final List<dynamic> tags = decodedParticipantInfo['tags'] ?? [];
      final List<String> restaurantTags = tags
          .whereType<String>()
          .where((tag) => tag.contains('res:'))
          .toList();

      final category = restaurantTags.isNotEmpty ? restaurantTags.first : null;

      final rankings = await rankingRepository.getRankings(
        apiKey: Environment.apiKey,
        campaign: Environment.campaign,
        distinctId: uidUser,
        category: category ?? '',
      );
  
      state = state.copyWith(status: RankingStatus.loaded, rankings: rankings);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
          errorMessage: message,
          status: RankingStatus.error,
        );
      }, ref);
    }
  }
}

class RankingState {
  final RankingStatus status;
  final List<Ranking> rankings;
  final Ranking? participantRanking;
  final String? errorMessage;

  RankingState({
    this.status = RankingStatus.initial,
    this.rankings = const [],
    this.participantRanking,
    this.errorMessage,
  });

  RankingState copyWith({
    RankingStatus? status,
    List<Ranking>? rankings,
    Ranking? participantRanking,
    String? errorMessage,
  }) {
    return RankingState(
      status: status ?? this.status,
      rankings: rankings ?? this.rankings,
      participantRanking: participantRanking ?? this.participantRanking,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
