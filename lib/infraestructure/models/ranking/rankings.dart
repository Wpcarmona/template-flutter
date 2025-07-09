
import 'dart:convert';

RankingsResponse rankingsResponseFromJson(String str) => RankingsResponse.fromJson(json.decode(str));

String rankingsResponseToJson(RankingsResponse data) => json.encode(data.toJson());

class RankingsResponse {
    String ok;
    List<DataRanking> data;

    RankingsResponse({
        required this.ok,
        required this.data,
    });

    factory RankingsResponse.fromJson(Map<String, dynamic> json) => RankingsResponse(
        ok: json["ok"],
        data: List<DataRanking>.from(json["data"].map((x) => DataRanking.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataRanking {
    String name;
    String firstName;
    String lastName;
    int votes;
    int points;
    int rankingPoints;
    int level;
    PointsByPtype pointsByPtype;
    DataExtra data;
    dynamic colour;
    int ranking;

    DataRanking({
        required this.name,
        required this.firstName,
        required this.lastName,
        required this.votes,
        required this.points,
        required this.rankingPoints,
        required this.level,
        required this.pointsByPtype,
        required this.data,
        required this.colour,
        required this.ranking,
    });

    factory DataRanking.fromJson(Map<String, dynamic> json) => DataRanking(
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        votes: json["votes"],
        points: json["points"],
        rankingPoints: json["ranking_points"],
        level: json["level"],
        pointsByPtype: PointsByPtype.fromJson(json["points_by_ptype"]),
        data: DataExtra.fromJson(json["data"]),
        colour: json["colour"],
        ranking: json["ranking"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "votes": votes,
        "points": points,
        "ranking_points": rankingPoints,
        "level": level,
        "points_by_ptype": pointsByPtype.toJson(),
        "data": data.toJson(),
        "colour": colour,
        "ranking": ranking,
    };
}

class DataExtra {
    List<String> tags;

    DataExtra({
        required this.tags,
    });

    factory DataExtra.fromJson(Map<String, dynamic> json) => DataExtra(
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
