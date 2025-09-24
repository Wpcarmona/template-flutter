import 'dart:convert';

import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/external_datasource/external_datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/mappers/external/external.dart';
import 'package:app_template/infraestructure/models/models.dart';
import 'package:dio/dio.dart';

class ExternalImplDatasource extends ExternalDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl,
  ));

  CreateActivityExternal externalToEntitiy(Map<String, dynamic> json) {
    final response = CreateActivityExternalResponse.fromJson(json);
    return CreateExternalMapper.createExternalEntity(response);
  }

   ExternalFormField _jsonToExternalFormField(Map<String, dynamic> json) {
    final challengeResponse = DynamicFieldsResponse.fromJson(json);
    return ExternaFormFieldMapper.externalFormFieldToEntity(challengeResponse);
  }

  List<ExternalFormList> _jsonToExternalFormList(Map<String, dynamic> json) {
    final externalFormList = ExternalFormResponse.fromJson(json);
    return externalFormList.data.externals.map(
        ExternalFormMapper.externalFormListToEntity).toList();
  }

  @override
  Future<CreateActivityExternal> sendClicks(
      {required String token,
      required String event,
      required String name}) async {
    final response = await dio.post('/events',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'event': event,
          'properties': {'name': name}
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return externalToEntitiy(responseData);
  }
  
  @override
  Future<CreateActivityExternal> createActivityExternal({required String token, required String event, required String category, required Map<String, dynamic> properties}) async {
   final response = await dio.post('/events',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'event': event,
          'category': category,
          'properties': properties
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return externalToEntitiy(responseData);
  }
  
  @override
  Future<ExternalFormField> getExternalFormField({required String token, required String externalActionId}) async {
    final response = await dio.post('/external_forms/actions/fields_info',
      options: Options(headers: {
        'Authorization': 'bearer $token',
      }),
      data: {
        'external_action_id': externalActionId,
      });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToExternalFormField(responseData);
  }

  @override
  Future <List<ExternalFormList>> getExternalFormListByCategory({required String token, required String category}) async {
    final response = await dio.post('/external_forms/actions/list',
      options: Options(headers: {
        'Authorization': 'bearer $token',
      }),
      data: {
        'category': category,
      });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToExternalFormList(responseData);
  }

  
}
