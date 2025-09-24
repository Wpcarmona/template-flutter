import 'dart:convert';

UpdateParticipantResponse updateParticipantResponseFromJson(String str) => UpdateParticipantResponse.fromJson(json.decode(str));

String updateParticipantResponseToJson(UpdateParticipantResponse data) => json.encode(data.toJson());

class UpdateParticipantResponse {
    String ok;
    String message;

    UpdateParticipantResponse({
        required this.ok,
        required this.message,
    });

    factory UpdateParticipantResponse.fromJson(Map<String, dynamic> json) => UpdateParticipantResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
