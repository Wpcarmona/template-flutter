import 'package:app_template/domain/entities/entities.dart';

abstract class PrizesRepository {
  Future<List<Reward>> getPrizes({
    required String limit,
  });

  Future<CheckRedeem> checkRedeem({
    required String distinctId,
    required String rewardId,
  });

  Future<RedeemPrizes> redeemPrize(
      {required String distinctId,
      required String rewardId,
      Map<String, dynamic>? formData});

  Future<GetDataCoupon> getDataCoupon(
      {required String prizeId,
      required String key,
      Map<String, dynamic>? opts});

  Future<GenerateCoupons> generateCoupons(
      {required String distinctId,
      required String prizeId,
      required Map<String, dynamic> opts});
}
