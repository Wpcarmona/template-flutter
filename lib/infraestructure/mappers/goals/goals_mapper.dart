import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/goals/get_goals.dart';

class GoalsMapper {
  static GetGoals getGoalsToEntity(GoalStatus goal) => GetGoals(
      id: goal.id,
      userId: goal.participationId,
      goalId: goal.goalId,
      status: goal.status,
      name: goal.name,
      description: goal.desc,
      image: goal.image.url,
      formula: goal.formula,
      activityTarget: goal.activityTarget,
      activityTimes: goal.activityTimes,
      startsDate: goal.startsAt,
      endDate: goal.endsAt,
      period: goal.period,
      periodBegins: goal.periodBegins,
      periodEnds: goal.periodEnds,
      sponsorID: goal.sponsorId,
      tags: goal.tags,
      sponsorPercentage: goal.sponsorPercentage,
      isEnabled: goal.enabled,
      giveNormalPoints: goal.giveNormalPoints);
}
