
import 'package:app_template/domain/entities/entities.dart';

abstract class RankingDatasource {
  Future<List<Ranking>> getRankings({
    required String apiKey,
    required String campaign,
    required String distinctId,
    required String category,
  });

  Future<Ranking> getParticipantRanking({
    required String apiKey,
    required String campaign,
    required String distinctId,
  }); 
}