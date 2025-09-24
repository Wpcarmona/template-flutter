

import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/prizes/prizes.dart' hide RewardRedeem;

class PrizesMapper {
  static CheckRedeem checkRedeemResponseToCheckRedeem(
      CheckRedeemResponse checkRedeemResponse) {
    return CheckRedeem(
      ok: checkRedeemResponse.ok,
      isavailable: checkRedeemResponse.data.prize.isAvailable,
      isredeemable: checkRedeemResponse.data.prize.isRedeemable,
      isparticipantcanredeem: checkRedeemResponse.data.participantCheck.canRedeem,
      errorParticipantCheck: checkRedeemResponse.data.participantCheck.message,
    );
  }

  static Reward rewardResponseToReward(DatasReward rewardResponse) {
    return Reward(
      id: rewardResponse.id,
      type: rewardResponse.type,
      category: rewardResponse.category,
      description: rewardResponse.description,
      expirationDays: rewardResponse.expirationDays,
      name: rewardResponse.name,
      points: rewardResponse.points,
      redeemable: rewardResponse.redeemable,
      tags: rewardResponse.tags,
      unlimited: rewardResponse.unlimited,
      pointType: rewardResponse.pointType,
      sponsor: rewardResponse.sponsor,
      sponsorId: rewardResponse.sponsorId,
      requireRedemtionToken: rewardResponse.requireRedemptionToken,
      termsAndConditions: rewardResponse.tc,
      image: rewardResponse.imageUrl,
      avalible: rewardResponse.available,
      redeemUrl: rewardResponse.redeemUrl,
      customData: rewardResponse.customData,
      brands: rewardResponse.metadata?.brands
          .map((brand) => Brands(
               brandId: brand.brandId,
               name: brand.name
              ))
          .toList(),
      cities: rewardResponse.metadata?.cities,
      localizable: rewardResponse.metadata?.localizable,
    );
  }

  static RedeemPrizes redeemPrizesResponseToRedeemPrizes(
      RedeemPrizeResponse redeemPrizeResponse) {
    return RedeemPrizes(
        ok: redeemPrizeResponse.ok,
        message: redeemPrizeResponse.object.message,
        points: redeemPrizeResponse.object.points,
        rewardRedeem: RewardRedeem(
          id: redeemPrizeResponse.object.reward.id,
          name: redeemPrizeResponse.object.reward.name,
          description: redeemPrizeResponse.object.reward.description,
          redeemUrl: redeemPrizeResponse.object.reward.redeemUrl,
        ),
        redemptionReward: RedemptionReward(
          id: redeemPrizeResponse.object.redemption.id,
          imageUrl: redeemPrizeResponse.object.redemption.imageUrl,
          prizesName: redeemPrizeResponse.object.redemption.prizeName,
          redeemId: redeemPrizeResponse.object.redemption.redeemId,
        ));
  }

  static GetDataCoupon getDataCouponResponseToGetDataCoupon(
      GetDataCouponResponse getDataCouponResponse) {
    return GetDataCoupon(
      brands: getDataCouponResponse.data.brands
          .map((brand) => Brands(
                brandId: brand.brandId,
                name: brand.name,
              ))
          .toList(),
    );
  }

  static GenerateCoupons getGenerateCouponsResponseToGenerateCoupons(
      GenerateCouponResponse generateCouponResponse) {
    return GenerateCoupons(
      ok: generateCouponResponse.ok,
      message: generateCouponResponse.object.message,
      id: generateCouponResponse.object.coupon.id,
      description: generateCouponResponse.object.coupon.description,
      imageUrl: generateCouponResponse.object.coupon.imageUrl,
      name: generateCouponResponse.object.coupon.name,
      pointType: generateCouponResponse.object.coupon.pointType,
      points: generateCouponResponse.object.coupon.pointType,
      redeemUrl: generateCouponResponse.object.coupon.redeemUrl,
      tyc: generateCouponResponse.object.coupon.metadata.condiciones,
      type: generateCouponResponse.object.coupon.type,
      metadata: MetadataCouponsGenerate(
        brandId: generateCouponResponse.object.coupon.metadata.brandId,
        description: generateCouponResponse.object.coupon.metadata.description,
        image: generateCouponResponse.object.coupon.metadata.image,
        name: generateCouponResponse.object.coupon.metadata.name,
        pvp: generateCouponResponse.object.coupon.metadata.pvp,
        productId: generateCouponResponse.object.coupon.metadata.productId,
        tyc: generateCouponResponse.object.coupon.metadata.condiciones
      ),
      redemption: RedemtionCouponsGenerate(
        id: generateCouponResponse.object.redemption.id,
        imageUrl: generateCouponResponse.object.redemption.imageUrl,
        redeemId: generateCouponResponse.object.redemption.redeemId,
        downloadUrl: generateCouponResponse.object.redemption.downloadUrl,
        prizeName: generateCouponResponse.object.redemption.prizeName,
      )
    );
  }

}
