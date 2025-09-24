import 'dart:convert';

import 'package:app_template/config/config.dart';
import 'package:app_template/domain/entities/prizes/prizes.dart';
import 'package:app_template/domain/repositories/prizes_repository/prizes_repository.dart';
import 'package:app_template/infraestructure/repositories/prizes_repository/prizes_repository.dart';
import 'package:app_template/presentation/presentation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PrizesStatus {
  initial,
  loading,
  success,
  checkin,
  error,
}

final prizesProvider =
    StateNotifierProvider<PrizesNotifier, PrizesState>((ref) {
  final prizesRepository = PrizesRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  return PrizesNotifier(
    ref: ref,
    prizesRepository: prizesRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class PrizesNotifier extends StateNotifier<PrizesState> {
  final Ref ref;
  final PrizesRepository prizesRepository;
  final KeyValueStorageService keyValueStorageService;

  PrizesNotifier({
    required this.ref,
    required this.prizesRepository,
    required this.keyValueStorageService,
  }) : super(const PrizesState());

  void reset() {
    state = const PrizesState();
  }

  void resetEphemeral() {
    state = PrizesState(
      status: PrizesStatus.success,
      rewards: state.rewards,
      checkRedeem: null,
      redeemPrize: null,
      redeemCoupon: null,
      errorMessage: null,
    );
  }

  Future<void> getPrizes() async {
    try {
      state = state.copyWith(status: PrizesStatus.loading);
      final getPrizes = await prizesRepository.getPrizes(limit: '300');
      _getPrizes(getPrizes);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state =
            state.copyWith(errorMessage: message, status: PrizesStatus.error);
      }, ref);
    }
  }

  Future<void> middleServiceRedeemPrize({
    required Reward reward,
    int? brandId,
    Map<String, dynamic>? formData,
  }) async {
    state = state.copyWith(status: PrizesStatus.loading);

    final check = await checkRedeem(rewardId: reward.id);
    if (check == null) {
      return;
    }

    final ok = check.ok == 'true' &&
        check.isavailable &&
        check.isredeemable &&
        check.isparticipantcanredeem;

    if (!ok) {
      state = state.copyWith(
        status: PrizesStatus.error,
        errorMessage: check.errorParticipantCheck,
      );
      return;
    }

    if ((reward.type == 'CouponPrize' ||
        reward.type == 'ExternalCouponPrize')) {
      if (brandId == null) {
        state = state.copyWith(
          status: PrizesStatus.error,
          errorMessage: 'Debes seleccionar una marca.',
        );
        return;
      }
      await redeemCoupon(reward: reward, brandId: brandId);
    } else if (reward.type == 'CustomPrize') {
      if (formData == null) {
        state = state.copyWith(
          status: PrizesStatus.error,
          errorMessage: 'Debes completar los datos requeridos.',
        );
        return;
      }
      await redeemPrize(rewardId: reward.id, formData: formData);
    } else {
      await redeemPrize(rewardId: reward.id);
    }
  }

  Future<CheckRedeem?> checkRedeem({required String rewardId}) async {
    try {
      final userInfo =
          await keyValueStorageService.getValue<String>(AppKeys.userInfo);
      if (userInfo == null) return null;

      final uidUser = jsonDecode(userInfo)['uid'];
      final checkRedeem = await prizesRepository.checkRedeem(
        distinctId: uidUser,
        rewardId: rewardId,
      );

      state = state.copyWith(
        status: PrizesStatus.checkin,
        checkRedeem: checkRedeem,
        isActionInProgress: false,
      );

      return checkRedeem;
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state =
            state.copyWith(isActionInProgress: false, errorMessage: message, status: PrizesStatus.error);
      }, ref);
    }
    return null;
  }

  Future<void> redeemPrize(
      {required String rewardId, Map<String, dynamic>? formData}) async {
    try {
      state = state.copyWith(status: PrizesStatus.loading);
      final userInfo =
          await keyValueStorageService.getValue<String>(AppKeys.userInfo);
      if (userInfo == null) return;
      final uidUser = jsonDecode(userInfo)['uid'];
      final redeemPrize = await prizesRepository.redeemPrize(
        distinctId: uidUser,
        rewardId: rewardId,
        formData: formData,
      );
      _redeemPrize(redeemPrize);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state =
            state.copyWith(errorMessage: message, status: PrizesStatus.error);
      }, ref);
    }
  }

  _getPrizes(List<Reward> getPrizes) {
    state = state.copyWith(rewards: getPrizes, status: PrizesStatus.success);
  }

  Future<void> redeemCoupon(
      {required Reward reward, required int brandId}) async {
    try {
      state = state.copyWith(status: PrizesStatus.loading);
      final userInfo =
          await keyValueStorageService.getValue<String>(AppKeys.userInfo);
      if (userInfo == null) return;
      final uidUser = jsonDecode(userInfo)['uid'];
      final redeemCoupon = await prizesRepository
          .generateCoupons(distinctId: uidUser, prizeId: reward.id, opts: {
        'brand_id': brandId,
      });
      _redeemCoupon(redeemCoupon);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state =
            state.copyWith(errorMessage: message, status: PrizesStatus.error);
      }, ref);
    }
  }

  _redeemPrize(RedeemPrizes redeemPrize) {
    if (redeemPrize.ok == 'true') {
      state = state.copyWith(
          redeemPrize: redeemPrize, status: PrizesStatus.success);
    } else {
      state = state.copyWith(
          errorMessage: redeemPrize.message, status: PrizesStatus.error);
    }
  }

  _redeemCoupon(GenerateCoupons redeemCoupon) {
    if (redeemCoupon.ok == 'true') {
      state = state.copyWith(
          redeemCoupon: redeemCoupon, status: PrizesStatus.success);
    } else {
      state = state.copyWith(
          errorMessage: redeemCoupon.message, status: PrizesStatus.error);
    }
  }
}

class PrizesState {
  final PrizesStatus status;
  final List<Reward> rewards;
  final CheckRedeem? checkRedeem;
  final RedeemPrizes? redeemPrize;
  final GenerateCoupons? redeemCoupon;
  final bool isActionInProgress;
  final String? errorMessage;

  const PrizesState({
    this.status = PrizesStatus.initial,
    this.rewards = const [],
    this.checkRedeem,
    this.redeemPrize,
    this.redeemCoupon,
    this.isActionInProgress = false,
    this.errorMessage,
  });

  PrizesState copyWith({
    PrizesStatus? status,
    List<Reward>? rewards,
    CheckRedeem? checkRedeem,
    RedeemPrizes? redeemPrize,
    GenerateCoupons? redeemCoupon,
    String? errorMessage,
    bool? isActionInProgress,
  }) {
    return PrizesState(
      status: status ?? this.status,
      rewards: rewards ?? this.rewards,
      checkRedeem: checkRedeem ?? this.checkRedeem,
      redeemPrize: redeemPrize ?? this.redeemPrize,
      redeemCoupon: redeemCoupon ?? this.redeemCoupon,
      errorMessage: errorMessage ?? this.errorMessage,
      isActionInProgress: isActionInProgress ?? this.isActionInProgress,
    );
  }
}
