import 'dart:convert';

ValidateChannelResponse validateChannelResponseFromJson(String str) => ValidateChannelResponse.fromJson(json.decode(str));

String validateChannelResponseToJson(ValidateChannelResponse data) => json.encode(data.toJson());

class ValidateChannelResponse {
    String ok;
    String message;

    ValidateChannelResponse({
        required this.ok,
        required this.message,
    });

    factory ValidateChannelResponse.fromJson(Map<String, dynamic> json) => ValidateChannelResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
