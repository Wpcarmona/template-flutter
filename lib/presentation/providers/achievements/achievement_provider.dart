import 'dart:convert';

import 'package:app_template/infraestructure/infraestructure.dart';
import 'package:app_template/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/domain/domain.dart';
import 'package:app_template/config/config.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

enum AchievementStatus {
  initial,
  loading,
  success,
  error,
}

final achievementProvider =
    StateNotifierProvider<AchievementNotifier, AchievementState>((ref) {
  final achievementRepository = AchievementRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  return AchievementNotifier(
    ref: ref,
    achievementRepository: achievementRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class AchievementNotifier extends StateNotifier<AchievementState> {
  final Ref ref;
  final AchievementsRepository achievementRepository;
  final KeyValueStorageService keyValueStorageService;

  AchievementNotifier({
    required this.ref,
    required this.achievementRepository,
    required this.keyValueStorageService,
  }) : super(AchievementState());

  Future<void> getAchievement() async {
    try {
      final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final token =
          await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      final userInfo =
          await keyValueStorageService.getValue<String>(AppKeys.userInfo);
      if (userInfo == null) return;
      final uidUser = jsonDecode(userInfo)['uid'];
      state = state.copyWith(status: AchievementStatus.loading);
      final getAchievement =
          await achievementRepository.getAchievement(token: token, dateFilter: {
        'sdate': '2022-01-01',
        'edate': today,
      },
      distinctId: uidUser
      );
      _getAchievement(getAchievement);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, status: AchievementStatus.error);
      }, ref);
    }
  }

  _getAchievement(List<GetAchievements> getAchievement) {
    state = state.copyWith(
        getAchievement: getAchievement, status: AchievementStatus.success);
  }
}

class AchievementState {
  final AchievementStatus status;
  final List<GetAchievements> getAchievement;
  final String errorMessage;

  const AchievementState({
    this.status = AchievementStatus.initial,
    this.getAchievement = const [],
    this.errorMessage = '',
  });

  AchievementState copyWith({
    AchievementStatus? status,
    List<GetAchievements>? getAchievement,
    String? errorMessage,
  }) =>
      AchievementState(
        status: status ?? this.status,
        getAchievement: getAchievement ?? this.getAchievement,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
