
import 'package:app_template/domain/entities/entities.dart';

class GetComments {
  final String id;
  final String date;
  final String body;
  final bool isVoted;
  final Participant participant;

  GetComments({
    required this.id,
    required this.date,
    required this.body,
    required this.isVoted,
    required this.participant,
  });
}