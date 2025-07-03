

import 'package:app_template/domain/entities/achievements/get_achievements.dart';
import 'package:app_template/infraestructure/models/achievements/achievements_models.dart';

class AchievementsMapper {
  static GetAchievements getAchievementsToEntity(Achievement response) => GetAchievements(
    id: response.id,
    date: response.createdAt,
    name: response.goalName,
    points: response.totalReward
  );
}