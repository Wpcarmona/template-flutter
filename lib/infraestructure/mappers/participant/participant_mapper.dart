

import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/auth/auth.dart';
import 'package:app_template/infraestructure/models/participant/find_participant_with_tags.dart';
import 'package:app_template/infraestructure/models/participant/update_user_tags.dart';


class ParticipantMapper {
  static ParticipantInfoPublic participantPublicInfoToEntity(
          PublicInfoUserResponse participantPublicInfo) =>
      ParticipantInfoPublic(
          ok: participantPublicInfo.ok,
          info: PublicInfoUser(
              id: participantPublicInfo.object.uid,
              email: participantPublicInfo.object.email,
              points: participantPublicInfo.object.points,
              totalPoints: participantPublicInfo.object.totalPoints,
              coins: participantPublicInfo.object.coins,
              totalCoins: participantPublicInfo.object.totalCoins,
              tags: participantPublicInfo.object.tags));
  static FindParticipantWithTags findParticipantWithTagsToEntity(
      FindParticipantWithTagsResponse response) {
    final datum = response.data.last;

    return FindParticipantWithTags(
      id: datum.uid,
      points: datum.points.toDouble(),
      totalPoints: datum.totalPoints,
      tags: datum.tags,
      coins: datum.coins,
      totalCoins: datum.totalCoins,
    );
  }

    static UpdateTags updateTagsToEntity(UpdateParticipantResponse updateTags) => UpdateTags(
    ok: updateTags.ok, 
    message: updateTags.message);
}
