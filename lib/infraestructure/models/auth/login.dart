import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String ok;
    String token;
    User participant;
    String message;

    LoginResponse({
        required this.ok,
        required this.token,
        required this.participant,
        required this.message,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        token: json["token"],
        participant: User.fromJson(json["participant"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "participant": participant.toJson(),
        "message": message,
    };
}

class User {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    String uidType;
    String state;

    User({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        uid: json["uid"],
        uidType: json["uid_type"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "avatar": avatar,
        "uid": uid,
        "uid_type": uidType,
        "state": state,
    };
}
