class ParticipantInfoPublic {
  final String ok;
  final PublicInfoUser info;

  ParticipantInfoPublic({
    required this.ok,
    required this.info,
  });
}

class PublicInfoUser {
  final String id;
  final String email;
  final double points;
  final int totalPoints;
  final dynamic coins;
  final dynamic totalCoins;

  PublicInfoUser({
    required this.id,
    required this.email,
    required this.points,
    required this.totalPoints,
    required this.coins,
    required this.totalCoins,
  });
}
