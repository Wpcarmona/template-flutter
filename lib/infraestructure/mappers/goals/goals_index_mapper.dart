


import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/goals/get_index_goals.dart';

class GoalsIndexMapper {
  static GetIndexGoals getGoalIndexToEntity(Goal goal) => GetIndexGoals(
    id: goal.id,
    name: goal.name,
    description: goal.desc,
    image: goal.image.url,
    createAt: goal.createdAt,
    endsAt: goal.endsAt,
    activityTime: goal.activityTimes,
    brandId: goal.brandId,
    campaignId: goal.campaignId,
    delete: goal.deleted,
    enabled: goal.enabled,
    formula: goal.formula,
    sponsorName: goal.sponsorName,
    tags: goal.tags
  );
}