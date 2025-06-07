
import 'package:app_template/domain/entities/entities.dart';

class Blog {
  final String id;
  final String title;
  final String body;
  final String date;
  final int votesCount;
  final bool isVoted;
  final Participant participant;

  Blog({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.votesCount,
    required this.isVoted,
    required this.participant,
  });
}