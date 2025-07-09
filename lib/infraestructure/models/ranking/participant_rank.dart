import 'dart:convert';

ParticipantRankResponse participantRankResponseFromJson(String str) => ParticipantRankResponse.fromJson(json.decode(str));

String participantRankResponseToJson(ParticipantRankResponse data) => json.encode(data.toJson());

class ParticipantRankResponse {
    String ok;
    ParticipantRankResponseData data;

    ParticipantRankResponse({
        required this.ok,
        required this.data,
    });

    factory ParticipantRankResponse.fromJson(Map<String, dynamic> json) => ParticipantRankResponse(
        ok: json["ok"],
        data: ParticipantRankResponseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class ParticipantRankResponseData {
    String name;
    String firstName;
    String lastName;
    int votes;
    int points;
    int level;
    PointsByPtype pointsByPtype;
    DataData data;
    dynamic colour;
    List<String> tags;
    int ranking;

    ParticipantRankResponseData({
        required this.name,
        required this.firstName,
        required this.lastName,
        required this.votes,
        required this.points,
        required this.level,
        required this.pointsByPtype,
        required this.data,
        required this.colour,
        required this.tags,
        required this.ranking,
    });

    factory ParticipantRankResponseData.fromJson(Map<String, dynamic> json) => ParticipantRankResponseData(
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        votes: json["votes"],
        points: json["points"],
        level: json["level"],
        pointsByPtype: PointsByPtype.fromJson(json["points_by_ptype"]),
        data: DataData.fromJson(json["data"]),
        colour: json["colour"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        ranking: json["ranking"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "votes": votes,
        "points": points,
        "level": level,
        "points_by_ptype": pointsByPtype.toJson(),
        "data": data.toJson(),
        "colour": colour,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "ranking": ranking,
    };
}

class DataData {
    List<String> tags;

    DataData({
        required this.tags,
    });

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}

class PointsByPtype {
    PointsByPtype();

    factory PointsByPtype.fromJson(Map<String, dynamic> json) => PointsByPtype(
    );

    Map<String, dynamic> toJson() => {
    };
}
