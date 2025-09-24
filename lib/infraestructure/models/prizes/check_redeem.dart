import 'dart:convert';

CheckRedeemResponse checkRedeemResponseFromJson(String str) => CheckRedeemResponse.fromJson(json.decode(str));

String checkRedeemResponseToJson(CheckRedeemResponse data) => json.encode(data.toJson());

class CheckRedeemResponse {
    String ok;
    DataCheckRedeem data;

    CheckRedeemResponse({
        required this.ok,
        required this.data,
    });

    factory CheckRedeemResponse.fromJson(Map<String, dynamic> json) => CheckRedeemResponse(
        ok: json["ok"],
        data: DataCheckRedeem.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class DataCheckRedeem {
    Prize prize;
    ParticipantCheck participantCheck;
    List<dynamic> extraForm;

    DataCheckRedeem({
        required this.prize,
        required this.participantCheck,
        required this.extraForm,
    });

    factory DataCheckRedeem.fromJson(Map<String, dynamic> json) => DataCheckRedeem(
        prize: Prize.fromJson(json["prize"]),
        participantCheck: ParticipantCheck.fromJson(json["participant_check"]),
        extraForm: List<dynamic>.from(json["extra_form"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "prize": prize.toJson(),
        "participant_check": participantCheck.toJson(),
        "extra_form": List<dynamic>.from(extraForm.map((x) => x)),
    };
}

class ParticipantCheck {
    int missingPoints;
    dynamic missingLevel;
    dynamic missingBadges;
    dynamic missingRule;
    bool userOverlimit;
    bool requireToken;
    bool canRedeem;
    String message;

    ParticipantCheck({
        required this.missingPoints,
        required this.missingLevel,
        required this.missingBadges,
        required this.missingRule,
        required this.userOverlimit,
        required this.requireToken,
        required this.canRedeem,
        required this.message,
    });

    factory ParticipantCheck.fromJson(Map<String, dynamic> json) => ParticipantCheck(
        missingPoints: json["missing_points"],
        missingLevel: json["missing_level"],
        missingBadges: json["missing_badges"],
        missingRule: json["missing_rule"],
        userOverlimit: json["user_overlimit"],
        requireToken: json["require_token"],
        canRedeem: json["can_redeem"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "missing_points": missingPoints,
        "missing_level": missingLevel,
        "missing_badges": missingBadges,
        "missing_rule": missingRule,
        "user_overlimit": userOverlimit,
        "require_token": requireToken,
        "can_redeem": canRedeem,
        "message": message,
    };
}

class Prize {
    String type;
    String name;
    String description;
    int points;
    bool isRedeemable;
    bool isAvailable;
    bool requireExtraForm;

    Prize({
        required this.type,
        required this.name,
        required this.description,
        required this.points,
        required this.isRedeemable,
        required this.isAvailable,
        required this.requireExtraForm,
    });

    factory Prize.fromJson(Map<String, dynamic> json) => Prize(
        type: json["_type"],
        name: json["name"],
        description: json["description"],
        points: json["points"],
        isRedeemable: json["is_redeemable"],
        isAvailable: json["is_available"],
        requireExtraForm: json["require_extra_form"],
    );

    Map<String, dynamic> toJson() => {
        "_type": type,
        "name": name,
        "description": description,
        "points": points,
        "is_redeemable": isRedeemable,
        "is_available": isAvailable,
        "require_extra_form": requireExtraForm,
    };
}
