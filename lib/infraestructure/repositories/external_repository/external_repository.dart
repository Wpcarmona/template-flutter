

import 'package:app_template/infraestructure/datasources/external_datasource/external_datasource.dart';
import 'package:app_template/domain/repositories/external_repository/external_repository.dart';
import 'package:app_template/domain/datasource/external_datasource/external_datasource.dart';
import 'package:app_template/domain/entities/entities.dart';

class ExternalRepositoryImpl extends ExternalRepository {
  final ExternalDatasource datasource;

  ExternalRepositoryImpl([ExternalDatasource? datasource]): datasource = datasource ?? ExternalImplDatasource();


  @override
  Future<void> sendClicks({required String toke, required String event, required String name}) {
    return datasource.sendClicks(token: toke, event: event, name: name);
  }

  @override
  Future<CreateActivityExternal> createActivityExternal({required String token, required String event, required String category, required Map<String, dynamic> properties}) {
    return datasource.createActivityExternal(token: token, event: event, category: category, properties: properties);
  }

  @override
  Future<ExternalFormField> getExternalFormField({required String token, required String externalActionId}) {
    return datasource.getExternalFormField(token: token, externalActionId: externalActionId);
  }
  
}