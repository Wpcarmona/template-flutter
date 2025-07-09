class Ranking {
  final String name;
  final String firstname;
  final String lastName;
  final int points;
  final int ranking;
  final String? avatar;

  Ranking({
    required this.name,
    required this.firstname,
    required this.lastName,
    required this.points,
    required this.ranking,
    this.avatar,
  });
}
