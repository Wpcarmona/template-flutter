




import 'package:app_template/domain/entities/participant/participant.dart';

class Register {
  final String ok;
  final String token;
  final Participant participant;
  final String message;
  
  Register({
    required this.ok,
    required this.token,
    required this.participant,
    required this.message,
  });
}

