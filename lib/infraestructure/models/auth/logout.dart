import 'dart:convert';

LogoutResponse logoutResponseFromJson(String str) => LogoutResponse.fromJson(json.decode(str));

String logoutResponseToJson(LogoutResponse data) => json.encode(data.toJson());

class LogoutResponse {
    String ok;
    String message;

    LogoutResponse({
        required this.ok,
        required this.message,
    });

    factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
