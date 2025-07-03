
import 'package:app_template/domain/datasource/achievements_datasource/achievement_datasource.dart';
import 'package:app_template/domain/entities/achievements/get_achievements.dart';
import 'package:app_template/domain/repositories/achievements_repository/achievements_repository.dart';
import 'package:app_template/infraestructure/datasources/achievements_datasource/achievements_datasource.dart';

class AchievementRepositoryImpl extends AchievementsRepository {
  final AchievementDatasource datasource;

  AchievementRepositoryImpl([AchievementDatasource? datasource]) : datasource = datasource ?? AchievementsImplDatasource();

  @override
  Future<List<GetAchievements>> getAchievement({required String token, required Map<String, String> dateFilter, required String distinctId}) {
    return datasource.getAchievement(token: token, dateFilter: dateFilter, distinctId: distinctId);
  }
  
}