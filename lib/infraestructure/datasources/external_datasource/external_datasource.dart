import 'dart:convert';

import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/external_datasource/external_datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/mappers/external/create_external_mapper.dart';
import 'package:app_template/infraestructure/models/external/create_external.dart';
import 'package:dio/dio.dart';

class ExternalImplDatasource extends ExternalDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl,
  ));

  CreateActivityExternal externalToEntitiy(Map<String, dynamic> json) {
    final response = CreateActivityExternalResponse.fromJson(json);
    return CreateExternalMapper.createExternalEntity(response);
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
  
}
