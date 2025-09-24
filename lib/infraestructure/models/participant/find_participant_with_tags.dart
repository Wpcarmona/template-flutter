import 'dart:convert';

FindParticipantWithTagsResponse findParticipantWithTagsResponseFromJson(String str) => FindParticipantWithTagsResponse.fromJson(json.decode(str));

String findParticipantWithTagsResponseToJson(FindParticipantWithTagsResponse data) => json.encode(data.toJson());

class FindParticipantWithTagsResponse {
    String ok;
    List<Datum> data;

    FindParticipantWithTagsResponse({
        required this.ok,
        required this.data,
    });

    factory FindParticipantWithTagsResponse.fromJson(Map<String, dynamic> json) => FindParticipantWithTagsResponse(
        ok: json["ok"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String uid;
    dynamic uidType;
    String state;
    String name;
    int totalPoints;
    List<String> tags;
    DateTime lastActivityAt;
    String id;
    String firstName;
    String lastName;
    int createdAt;
    Level level;
    int points;
    List<Coin> totalCoins;
    List<Coin> coins;
    String pictureUrl;
    String largePictureUrl;
    Level nextLevel;
    String teamId;
    String team;
    bool emailVerified;
    bool cellphoneVerified;

    Datum({
        required this.uid,
        required this.uidType,
        required this.state,
        required this.name,
        required this.totalPoints,
        required this.tags,
        required this.lastActivityAt,
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.createdAt,
        required this.level,
        required this.points,
        required this.totalCoins,
        required this.coins,
        required this.pictureUrl,
        required this.largePictureUrl,
        required this.nextLevel,
        required this.teamId,
        required this.team,
        required this.emailVerified,
        required this.cellphoneVerified,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uid: json["uid"],
        uidType: json["uid_type"],
        state: json["state"],
        name: json["name"],
        totalPoints: (json["total_points"] as num).toInt(),
        tags: List<String>.from(json["tags"].map((x) => x)),
        lastActivityAt: DateTime.parse(json["last_activity_at"]),
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        createdAt: json["created_at"],
        level: Level.fromJson(json["level"]),
        points: (json["points"] as num).toInt(),
        totalCoins: List<Coin>.from(json["total_coins"].map((x) => Coin.fromJson(x))),
        coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
        pictureUrl: json["picture_url"],
        largePictureUrl: json["large_picture_url"],
        nextLevel: Level.fromJson(json["next_level"]),
        teamId: json["team_id"],
        team: json["team"],
        emailVerified: json["email_verified"],
        cellphoneVerified: json["cellphone_verified"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "uid_type": uidType,
        "state": state,
        "name": name,
        "total_points": totalPoints,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "last_activity_at": lastActivityAt.toIso8601String(),
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "created_at": createdAt,
        "level": level.toJson(),
        "points": points,
        "total_coins": List<dynamic>.from(totalCoins.map((x) => x.toJson())),
        "coins": List<dynamic>.from(coins.map((x) => x.toJson())),
        "picture_url": pictureUrl,
        "large_picture_url": largePictureUrl,
        "next_level": nextLevel.toJson(),
        "team_id": teamId,
        "team": team,
        "email_verified": emailVerified,
        "cellphone_verified": cellphoneVerified,
    };
}

class Coin {
    String ptId;
    String name;
    int total;

    Coin({
        required this.ptId,
        required this.name,
        required this.total,
    });

    factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        ptId: json["pt_id"],
        name: json["name"],
        total: (json["total"] as num).toInt(),
    );

    Map<String, dynamic> toJson() => {
        "pt_id": ptId,
        "name": name,
        "total": total,
    };
}

class Level {
    Level();

    factory Level.fromJson(Map<String, dynamic> json) => Level(
    );

    Map<String, dynamic> toJson() => {
    };
}
