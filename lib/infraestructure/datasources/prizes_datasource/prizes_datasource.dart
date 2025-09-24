import 'package:app_template/config/config.dart';
import 'package:app_template/domain/datasource/prizes_datasource/prizes_datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/mappers/prizes/prizes_mapper.dart';
import 'package:app_template/infraestructure/models/prizes/prizes.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class PrizesDatasourceImpl extends PrizesDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.altBaseUlr));

  List<Reward> _jsonToRewardList(Map<String, dynamic> json) {
    final rewardsResponse = RewardsResponse.fromJson(json);
    return rewardsResponse.object
        .map(PrizesMapper.rewardResponseToReward)
        .toList();
  }

  CheckRedeem _jsonToCheckRedeem(Map<String, dynamic> json) {
    final checkRedeemResponse = CheckRedeemResponse.fromJson(json);
    return PrizesMapper.checkRedeemResponseToCheckRedeem(checkRedeemResponse);
  }

  RedeemPrizes _jsonToRedeemPrizes(Map<String, dynamic> json) {
    final redeemPrizeResponse = RedeemPrizeResponse.fromJson(json);
    return PrizesMapper.redeemPrizesResponseToRedeemPrizes(redeemPrizeResponse);
  }

  GetDataCoupon _jsonToGetDataCoupon(Map<String, dynamic> json) {
    final getDataCouponResponse = GetDataCouponResponse.fromJson(json);
    return PrizesMapper.getDataCouponResponseToGetDataCoupon(
        getDataCouponResponse);
  }

  GenerateCoupons _jsonToGenerateCoupons(Map<String, dynamic> json) {
    final generateCouponResponse = GenerateCouponResponse.fromJson(json);
    return PrizesMapper.getGenerateCouponsResponseToGenerateCoupons(
        generateCouponResponse);
  }

  @override
  Future<List<Reward>> getPrizes({
    required String limit,
  }) async {
    final response = await dio.get('/rewards',
        queryParameters: {'campaign': Environment.campaign, 'limit': limit},
        options: Options(
            headers: {'Authorization': 'Bearer ${Environment.apiKey}'}));
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToRewardList(responseData);
  }

  @override
  Future<CheckRedeem> checkRedeem(
      {required String distinctId, required String rewardId}) async {
    final response = await dio.post('/rewards/$rewardId/check', data: {
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'distinct_id': distinctId
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToCheckRedeem(responseData);
  }

  @override
  Future<RedeemPrizes> redeemPrize(
      {required String distinctId,
      required String rewardId,
      Map<String, dynamic>? formData}) async {
    final response = await dio.post('/rewards/$rewardId/redeem', data: {
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'distinct_id': distinctId,
      if (formData != null) 'form_data': formData
    });

    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToRedeemPrizes(responseData);
  }

  @override
  Future<GetDataCoupon> getDataCoupon(
      {required String prizeId,
      required String key,
      Map<String, dynamic>? opts}) async {
    final response = await dio.post('/coupons/$prizeId/external/$key', data: {
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'opts': opts
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGetDataCoupon(responseData);
  }

  @override
  Future<GenerateCoupons> generateCoupons(
      {required String distinctId,
      required String prizeId,
      required Map<String, dynamic> opts}) async {
    final response = await dio.post('/coupons/$prizeId/create', data: {
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'distinct_id': distinctId,
      'opts': opts
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGenerateCoupons(responseData);
  }
}
