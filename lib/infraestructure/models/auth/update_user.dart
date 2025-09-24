// To parse this JSON data, do
//
//     final updateUserResponse = updateUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_template/infraestructure/models/auth/auth.dart';


UpdateUserResponse updateUserResponseFromJson(String str) => UpdateUserResponse.fromJson(json.decode(str));

String updateUserResponseToJson(UpdateUserResponse data) => json.encode(data.toJson());

class UpdateUserResponse {
    final String ok;
    final String message;
    final User participantData;

    UpdateUserResponse({
        required this.ok,
        required this.message,
        required this.participantData,
    });

    factory UpdateUserResponse.fromJson(Map<String, dynamic> json) => UpdateUserResponse(
        ok: json["ok"],
        message: json["message"],
        participantData: User.fromJson(json["participant"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "participant_data": participantData.toJson(),
    };
}

