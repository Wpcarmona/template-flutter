

class GetGoals {
  final String id;
  final String userId;
  final String goalId;
  final String status;
  final String name;
  final String description;
  final String image;
  final String formula;
  final String activityTarget;
  final String startsDate;
  final String endDate; 
  final String period;
  final String periodBegins;
  final String periodEnds;
  final String sponsorID;
  final List<String> tags;
  final int activityTimes;
  final int sponsorPercentage;
  final bool isEnabled;
  final bool giveNormalPoints;

  GetGoals({
    required this.id,
    required this.userId,
    required this.goalId,
    required this.status,
    required this.name,
    required this.description,
    required this.image,
    required this.formula,
    required this.activityTarget,
    required this.startsDate,
    required this.endDate,
    required this.period,
    required this.periodBegins,
    required this.periodEnds,
    required this.sponsorID,
    required this.tags,
    required this.activityTimes,
    required this.sponsorPercentage,
    required this.isEnabled,
    required this.giveNormalPoints,
  });
}