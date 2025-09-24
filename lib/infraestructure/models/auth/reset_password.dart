import 'dart:convert';

ResetPasswordResponse resetPasswordResponseFromJson(String str) => ResetPasswordResponse.fromJson(json.decode(str));

String resetPasswordResponseToJson(ResetPasswordResponse data) => json.encode(data.toJson());

class ResetPasswordResponse {
    final String ok;
    final String message;

    ResetPasswordResponse({
        required this.ok,
        required this.message,
    });

    factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => ResetPasswordResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
