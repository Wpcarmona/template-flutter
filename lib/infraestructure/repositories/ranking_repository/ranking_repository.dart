

import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/ranking/ranking.dart';
import 'package:app_template/domain/repositories/ranking_repository/ranking_repository.dart';
import 'package:app_template/infraestructure/datasources/datasource_infraestructure.dart';

class RankingRepositoryImpl extends RankingRepository {
  final RankingDatasource datasource;

  RankingRepositoryImpl([RankingDatasource? datasource]) : datasource = datasource ?? RankingImplDatasource();

  @override
  Future<Ranking> getParticipantRanking({required String apiKey, required String campaign, required String distinctId}) {
    return datasource.getParticipantRanking(apiKey: apiKey, campaign: campaign, distinctId: distinctId);
  }

  @override
  Future<List<Ranking>> getRankings({required String apiKey, required String campaign, required String distinctId, required String category}) {
    return datasource.getRankings(apiKey: apiKey, campaign: campaign, distinctId: distinctId, category: category);
  }
  
}