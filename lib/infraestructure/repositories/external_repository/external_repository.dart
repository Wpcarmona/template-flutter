

import 'package:app_template/domain/datasource/external_datasource/external_datasource.dart';
import 'package:app_template/domain/repositories/external_repository/external_repository.dart';
import 'package:app_template/infraestructure/datasources/external_datasource/external_datasource.dart';

class ExternalRepositoryImpl extends ExternalRepository {
  final ExternalDatasource datasource;

  ExternalRepositoryImpl([ExternalDatasource? datasource]): datasource = datasource ?? ExternalImplDatasource();


  @override
  Future<void> sendClicks({required String toke, required String event, required String name}) {
    return datasource.sendClicks(token: toke, event: event, name: name);
  }
  
}