import 'dart:convert';

CreateUserResponse createUserResponseFromJson(String str) => CreateUserResponse.fromJson(json.decode(str));

String createUserResponseToJson(CreateUserResponse data) => json.encode(data.toJson());

class CreateUserResponse {
    String ok;
    String token;
    ParticipantData participantData;
    String message;

    CreateUserResponse({
        required this.ok,
        required this.token,
        required this.participantData,
        required this.message,
    });

    factory CreateUserResponse.fromJson(Map<String, dynamic> json) => CreateUserResponse(
        ok: json["ok"],
        token: json["token"],
        participantData: ParticipantData.fromJson(json["participant_data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "participant_data": participantData.toJson(),
        "message": message,
    };
}

class ParticipantData {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    String uidType;
    String state;

    ParticipantData({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory ParticipantData.fromJson(Map<String, dynamic> json) => ParticipantData(
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
