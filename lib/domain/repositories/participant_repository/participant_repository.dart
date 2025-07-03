
import 'package:app_template/domain/entities/entities.dart';

abstract class ParticipantRepository {
  Future<ParticipantInfoPublic> participantPublicInfo({required String token});

  Future<FindParticipantWithTags> findParticipantWithTags(
      {required String token,
      required bool withAdmin,
      required List<String> tags});

 Future<UpdateTags> updateTags({
    required String token,
    required String distinctId,
    required List<String> tags,
  });
}
