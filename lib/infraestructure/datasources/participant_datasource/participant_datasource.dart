

import 'dart:convert';

import 'package:app_template/config/config.dart';
import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/entities.dart' hide ParticipantInfoPublic;
import 'package:app_template/domain/entities/participant/public_participant_info.dart';
import 'package:app_template/infraestructure/mappers/participant/participant_mapper.dart';
import 'package:app_template/infraestructure/models/models.dart' hide ParticipantInfoPublic;
import 'package:dio/dio.dart';

class ParticipantImplDatasource extends ParticipantDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl,
  ));

  ParticipantInfoPublic _jsonToParticipantPublicInfo(
      Map<String, dynamic> json) {
    final participantPublicInfoResponse = PublicInfoUserResponse.fromJson(json);
    return ParticipantMapper.participantPublicInfoToEntity(
        participantPublicInfoResponse);
  }

  FindParticipantWithTags findParticipantWithTagsToEntity(
      Map<String, dynamic> json) {
    final findParticipantWithTagsResponse =
        FindParticipantWithTagsResponse.fromJson(json);
    return ParticipantMapper.findParticipantWithTagsToEntity(
        findParticipantWithTagsResponse);
  }

  UpdateTags _jsonToUpdateTags(Map<String, dynamic> json) {
    final updateTagsResponse = UpdateParticipantResponse.fromJson(json);
    return ParticipantMapper.updateTagsToEntity(updateTagsResponse);
  }

  @override
  Future<ParticipantInfoPublic> participantPublicInfo(
      {required String token}) async {
    final response = await dio.get('/participants/info',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToParticipantPublicInfo(responseData);
  }

  @override
  Future<FindParticipantWithTags> findParticipantWithTags(
      {required String token,
      required bool withAdmin,
      required List<String> tags}) async {
    final response = await dio.post('/participants/list',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'with_admins': withAdmin,
          'tags': tags,
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return findParticipantWithTagsToEntity(responseData);
  }

  @override
  Future<UpdateTags> updateTags(
      {required String token,
      required List<String> tags,
      required String distinctId}) async {
    final response = await dio.post('/participants/update',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {
          'api_key': Environment.apiKey,
          'campaign': Environment.campaign,
          'distinct_id': distinctId,
          'properties': {
            'tags': ['admin', 'mesero', ...tags],
          }
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToUpdateTags(responseData);
  }
}
