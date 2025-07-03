


import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/domain/repositories/repository.dart';
import 'package:app_template/infraestructure/datasources/participant_datasource/participant_datasource.dart';

class PariticipantRepositoryImpl extends ParticipantRepository {

  final ParticipantDatasource datasource;

  PariticipantRepositoryImpl([ParticipantDatasource? datasource])
   : datasource = datasource ?? ParticipantImplDatasource();


    @override
  Future<ParticipantInfoPublic> participantPublicInfo({required String token}) {
    return datasource.participantPublicInfo(token: token);
  }
 
  @override
  Future<FindParticipantWithTags> findParticipantWithTags({required String token, required bool withAdmin, required List<String> tags}) {
    return datasource.findParticipantWithTags(token: token, withAdmin: withAdmin, tags: tags);
  }

  @override
  Future<UpdateTags> updateTags({required String token, required String distinctId, required List<String> tags}) {
    return datasource.updateTags(token: token, distinctId: distinctId, tags: tags);
  }
  
}