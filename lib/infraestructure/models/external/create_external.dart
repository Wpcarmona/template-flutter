// To parse this JSON data, do
//
//     final createActivityExternalResponse = createActivityExternalResponseFromJson(jsonString);
import 'dart:convert';

CreateActivityExternalResponse createActivityExternalResponseFromJson(String str) => CreateActivityExternalResponse.fromJson(json.decode(str));

String createActivityExternalResponseToJson(CreateActivityExternalResponse data) => json.encode(data.toJson());

class CreateActivityExternalResponse {
    String ok;
    int points;
    Participant participant;
    String message;

    CreateActivityExternalResponse({
        required this.ok,
        required this.points,
        required this.participant,
        required this.message,
    });

    factory CreateActivityExternalResponse.fromJson(Map<String, dynamic> json) => CreateActivityExternalResponse(
        ok: json["ok"],
        points: json["points"],
        participant: Participant.fromJson(json["participant"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "points": points,
        "participant": participant.toJson(),
        "message": message,
    };
}

class Participant {
    int accumulatedPoints;
    int availablePoints;
    int redeemedPoints;
    int pointsToExpire;
    String expirationDate;
    int expiredPoints;

    Participant({
        required this.accumulatedPoints,
        required this.availablePoints,
        required this.redeemedPoints,
        required this.pointsToExpire,
        required this.expirationDate,
        required this.expiredPoints,
    });

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        accumulatedPoints: json["accumulated_points"],
        availablePoints: (json["available_points"] as num).toInt(),
        redeemedPoints: double.parse(json["redeemed_points"].toString()).toInt(),
        pointsToExpire: (json["points_to_expire"] as num).toInt(),
        expirationDate: json["expiration_date"],
        expiredPoints: (json["expired_points"] as num).toInt(),
    );

    Map<String, dynamic> toJson() => {
        "accumulated_points": accumulatedPoints,
        "available_points": availablePoints,
        "redeemed_points": redeemedPoints,
        "points_to_expire": pointsToExpire,
        "expiration_date": expirationDate,
        "expired_points": expiredPoints,
    };
}
