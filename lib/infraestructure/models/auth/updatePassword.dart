// To parse this JSON data, do
//
//     final updatePasswordResponse = updatePasswordResponseFromJson(jsonString);

import 'dart:convert';

UpdatePasswordResponse updatePasswordResponseFromJson(String str) => UpdatePasswordResponse.fromJson(json.decode(str));

String updatePasswordResponseToJson(UpdatePasswordResponse data) => json.encode(data.toJson());

class UpdatePasswordResponse {
    final String ok;
    final String message;

    UpdatePasswordResponse({
        required this.ok,
        required this.message,
    });

    factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) => UpdatePasswordResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
