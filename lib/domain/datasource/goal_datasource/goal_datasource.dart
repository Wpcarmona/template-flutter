import 'package:app_template/domain/entities/entities.dart';

abstract class ChallengeDatasource {
  
  Future<List<GetGoals>> getChallenges({
    required String token,
    required List<String> tags,
    int page = 1,
  });

  Future<ExternalFormField> getDetailChallenges({
    required String token,
    required String slug
  });

  Future<List<GetGoals>> getProducts({
    required String token,
    required List<String> tags,
    int page = 1,
  });

  Future<List<GetIndexGoals>> getIndexGoals({
    required bool enabled,
    required List<String> tags,
  });
}