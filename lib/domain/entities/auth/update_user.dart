import 'package:app_template/domain/entities/auth/login.dart';

class UpdateUser {
  final String ok;
  final String message;
  final Participant participant;

  UpdateUser({
    required this.ok,
    required this.message,
    required this.participant,
  });
}
