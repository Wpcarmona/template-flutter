class RedeemPrizes {
  final String ok;
  final String message;
  final double points;
  final RewardRedeem rewardRedeem;
  final RedemptionReward redemptionReward;

  RedeemPrizes({
    required this.ok,
    required this.message,
    required this.points,
    required this.rewardRedeem,
    required this.redemptionReward,
  });
}

class RewardRedeem {
  final String id;
  final String name;
  final String description;
  final String redeemUrl;

  RewardRedeem({
    required this.id,
    required this.name,
    required this.description,
    required this.redeemUrl,
  });
}

class RedemptionReward {
  final String id;
  final String redeemId;
  final String prizesName;
  final String imageUrl;

  RedemptionReward({
    required this.id,
    required this.redeemId,
    required this.prizesName,
    required this.imageUrl,
  });
}
