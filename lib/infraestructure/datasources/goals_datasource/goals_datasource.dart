


import 'dart:convert';

import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/mappers/goals/goals_index_mapper.dart';
import 'package:app_template/infraestructure/mappers/mappers.dart';
import 'package:app_template/infraestructure/models/goals/get_goals.dart';
import 'package:app_template/infraestructure/models/goals/get_index_goals.dart';
import 'package:app_template/infraestructure/models/models.dart';
import 'package:dio/dio.dart';

class ChallengeImplDataSource extends ChallengeDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.baseUrl));
  final dio2 = Dio(BaseOptions(baseUrl: Environment.altBaseUlr));

  List<GetGoals> _jsonToGetChallenges(Map<String, dynamic> json) {
    final challengeResponse = GetGoalsResponse.fromJson(json);
    return challengeResponse.data.goalStatuses
        .map(GoalsMapper.getGoalsToEntity)
        .toList();
  }

  ExternalFormField _jsonToExternalFormField(Map<String, dynamic> json) {
    final challengeResponse = DynamicFieldsResponse.fromJson(json);
    return ExternaFormFieldMapper.externalFormFieldToEntity(challengeResponse);
  }

  List<GetIndexGoals> _jsonToGetIndexGoals(Map<String, dynamic> json) {
    final challengeResponse = GoalIndexResponse.fromJson(json);
    return challengeResponse.data.goals
        .map(GoalsIndexMapper.getGoalIndexToEntity)
        .toList();
  }

  @override
  Future<List<GetGoals>> getChallenges(
      {required String token, required List<String> tags, int page = 1}) async {
    final response = await dio.post('/participants/goals',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'tags': tags,
          'page': page,
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGetChallenges(responseData);
  }

  @override
  Future<ExternalFormField> getDetailChallenges(
      {required String token, required String slug}) async {
    final response = await dio.post('/external_forms/actions/fields_info',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'slug': slug,
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToExternalFormField(responseData);
  }

  @override
  Future<List<GetGoals>> getProducts(
      {required String token, required List<String> tags, int page = 1}) async {
    final response = await dio.post('/participants/goals',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'tags': tags,
          'page': page,
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGetChallenges(responseData);
  }

  @override
  Future<List<GetIndexGoals>> getIndexGoals(
      {required bool enabled, required List<String> tags}) async {
    final response = await dio2.post('/goals/index', data: {
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'enabled': enabled,
      'tags': tags,
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGetIndexGoals(responseData);
  }
}
