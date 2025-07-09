import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/ranking/ranking.dart';
import 'package:app_template/infraestructure/mappers/ranking/ranking_mapper.dart';
import 'package:app_template/infraestructure/models/ranking/ranking.dart';

class RankingImplDatasource extends RankingDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.altBaseUlr));

  List<Ranking> _jsonToRankingList(Map<String, dynamic> json) {
    final rankingResponse = RankingsResponse.fromJson(json);
    return rankingResponse.data.map(RankingMapper.rankingToEntity).toList();
  }

  Ranking _jsonToParticipantRanking(Map<String, dynamic> json) {
    final participantRankResponse = ParticipantRankResponse.fromJson(json);
    return RankingMapper.participantRankToEntity(participantRankResponse);
  }

  @override
  Future<Ranking> getParticipantRanking(
      {required String apiKey,
      required String campaign,
      required String distinctId}) async {
    final response = await dio.post('/participants/ranks', data: {
      'api_key': apiKey,
      'campaign': campaign,
      'distinct_id': distinctId,
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToParticipantRanking(responseData);
  }

  @override
  Future<List<Ranking>> getRankings(
      {required String apiKey,
      required String campaign,
      required String distinctId,
      required String category}) async {
    final response = await dio.post('/participants/ranks/advanced', data: {
      'api_key': apiKey,
      'campaign': campaign,
      'distinct_id': distinctId,
      'category': category,
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToRankingList(responseData);
  }
}
