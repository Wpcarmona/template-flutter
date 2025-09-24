
class GetIndexGoals {
  final String id;
  final num activityTime;
  final String brandId;
  final String campaignId;
  final bool delete;
  final String description;
  final bool enabled;
  final String formula;
  final String image;
  final String name;
  final List<String> tags;
  final String sponsorName;
  final DateTime createAt;
  final DateTime endsAt;

  GetIndexGoals({
    required this.id,
    required this.activityTime,
    required this.brandId,
    required this.campaignId,
    required this.delete,
    required this.description,
    required this.enabled,
    required this.formula,
    required this.image,
    required this.name,
    required this.tags,
    required this.sponsorName,
    required this.createAt,
    required this.endsAt,
  });
}