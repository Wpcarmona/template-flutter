import 'dart:convert';

VerifyPhoneResponse verifyPhoneResponseFromJson(String str) => VerifyPhoneResponse.fromJson(json.decode(str));

String verifyPhoneResponseToJson(VerifyPhoneResponse data) => json.encode(data.toJson());

class VerifyPhoneResponse {
    String ok;
    String message;

    VerifyPhoneResponse({
        required this.ok,
        required this.message,
    });

    factory VerifyPhoneResponse.fromJson(Map<String, dynamic> json) => VerifyPhoneResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
