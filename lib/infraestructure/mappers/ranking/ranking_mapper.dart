import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/models.dart';

class RankingMapper {
  static Ranking participantRankToEntity(ParticipantRankResponse response) =>
      Ranking(
        firstname: response.data.firstName,
        lastName: response.data.lastName,
        name: response.data.name,
        ranking: response.data.ranking,
        points: response.data.points
      );

  static Ranking rankingToEntity(DataRanking response) => Ranking(
      name: response.name,
      firstname: response.firstName,
      lastName: response.lastName,
      points: response.points,
      ranking: response.ranking);
}
