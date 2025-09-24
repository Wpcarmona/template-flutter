

import 'package:app_template/domain/datasource/prizes_datasource/prizes_datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/domain/repositories/prizes_repository/prizes_repository.dart';
import 'package:app_template/infraestructure/datasources/prizes_datasource/prizes_datasource.dart';

class PrizesRepositoryImpl extends PrizesRepository {
  final PrizesDatasource datasource;

  PrizesRepositoryImpl([PrizesDatasource? datasource])
      : datasource = datasource ?? PrizesDatasourceImpl();

  @override
  Future<CheckRedeem> checkRedeem(
      {required String distinctId, required String rewardId}) {
    return datasource.checkRedeem(distinctId: distinctId, rewardId: rewardId);
  }

  @override
  Future<List<Reward>> getPrizes({required String limit}) {
    return datasource.getPrizes(limit: limit);
  }

  @override
  Future<RedeemPrizes> redeemPrize(
      {required String distinctId, required String rewardId, Map<String, dynamic>? formData}) {
    return datasource.redeemPrize(
        distinctId: distinctId, rewardId: rewardId, formData: formData);
  }

  @override
  Future<GetDataCoupon> getDataCoupon(
      {required String prizeId,
      required String key,
      Map<String, dynamic>? opts}) {
    return datasource.getDataCoupon(prizeId: prizeId, key: key, opts: opts);
  }

  @override
  Future<GenerateCoupons> generateCoupons(
      {required String distinctId,
      required String prizeId,
      required Map<String, dynamic> opts}) {
    return datasource.generateCoupons(
        distinctId: distinctId, opts: opts, prizeId: prizeId);
  }
}
