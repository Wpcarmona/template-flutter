

import 'dart:convert';

import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/achievements_datasource/achievement_datasource.dart';
import 'package:app_template/domain/entities/achievements/get_achievements.dart';
import 'package:app_template/infraestructure/mappers/achievements/achievements_mapper.dart';
import 'package:app_template/infraestructure/models/achievements/achievements_models.dart';
import 'package:dio/dio.dart';

class AchievementsImplDatasource extends AchievementDatasource {

  final dio = Dio(BaseOptions(baseUrl: Environment.baseUrl));



  List<GetAchievements> _jsonToAchievementsList(Map<String, dynamic> json) {
    final achievementsResponse = GetAchievementsResponse.fromJson(json);
    return achievementsResponse.data.achievements.map(AchievementsMapper.getAchievementsToEntity).toList();
  }

  @override
  Future<List<GetAchievements>> getAchievement({required String token, required Map<String, String> dateFilter, required String distinctId}) async {
   final response = await dio.post('/achievements/index',
      options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'date_filter': dateFilter,
          'distinct_id': distinctId,
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToAchievementsList(responseData);
  }
  
}