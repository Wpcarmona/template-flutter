

import 'package:app_template/domain/entities/achievements/get_achievements.dart';

abstract class AchievementsRepository {

  Future<List<GetAchievements>> getAchievement({
    required String token,
    required Map<String, String> dateFilter,
    required String distinctId,
  });
}