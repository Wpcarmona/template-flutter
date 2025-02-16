

class Login {
  final String ok;
  final String token;
  final UserLogin participant;
  final String message;

  Login({
    required this.ok,
    required this.token,
    required this.participant,
    required this.message,
    });
}

class UserLogin {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String uid;
  final String uidType;
  final String state;

  UserLogin({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.uid,
    required this.uidType,
    required this.state,
  });
}