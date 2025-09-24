import 'dart:convert';

SendVerifyPhoneResponse sendVerifyPhoneResponseFromJson(String str) => SendVerifyPhoneResponse.fromJson(json.decode(str));

String sendVerifyPhoneResponseToJson(SendVerifyPhoneResponse data) => json.encode(data.toJson());

class SendVerifyPhoneResponse {
    String ok;
    String message;

    SendVerifyPhoneResponse({
        required this.ok,
        required this.message,
    });

    factory SendVerifyPhoneResponse.fromJson(Map<String, dynamic> json) => SendVerifyPhoneResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
