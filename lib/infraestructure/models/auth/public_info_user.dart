import 'dart:convert';

PublicInfoUserResponse publicInfoUserResponseFromJson(String str) =>
    PublicInfoUserResponse.fromJson(json.decode(str));

String publicInfoUserResponseToJson(PublicInfoUserResponse data) =>
    json.encode(data.toJson());

class PublicInfoUserResponse {
  final String ok;
  final Object object;

  PublicInfoUserResponse({
    required this.ok,
    required this.object,
  });

  factory PublicInfoUserResponse.fromJson(Map<String, dynamic> json) =>
      PublicInfoUserResponse(
        ok: json["ok"],
        object: Object.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "object": object.toJson(),
      };
}

class Object {
  final String uid;
  final dynamic uidType;
  final String email;
  final double points;
  final int totalPoints;
  final List<dynamic> coins;
  final List<dynamic> totalCoins;
  final String state;
  final bool badEmail;
  final bool emailVerified;
  final bool cellphoneVerified;
  final bool unconfirmedEmail;
  final bool unconfirmedCellphone;
  final String avatar;
  final DateTime lastActivityAt;
  List<String> tags;

  Object(
      {required this.uid,
      required this.uidType,
      required this.email,
      required this.points,
      required this.totalPoints,
      required this.coins,
      required this.totalCoins,
      required this.state,
      required this.badEmail,
      required this.emailVerified,
      required this.cellphoneVerified,
      required this.unconfirmedEmail,
      required this.unconfirmedCellphone,
      required this.avatar,
      required this.lastActivityAt,
      required this.tags,
      });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        uid: json["uid"],
        uidType: json["uid_type"],
        email: json["email"],
        points: json["points"] ?? 0.0,
        totalPoints: json["total_points"] ?? 0,
        coins: List<dynamic>.from(json["coins"].map((x) => x)),
        totalCoins: List<dynamic>.from(json["total_coins"].map((x) => x)),
        state: json["state"],
        badEmail: json["bad_email"],
        emailVerified: json["email_verified"],
        cellphoneVerified: json["cellphone_verified"],
        unconfirmedEmail: json["unconfirmed_email"],
        unconfirmedCellphone: json["unconfirmed_cellphone"],
        avatar: json["avatar"],
        lastActivityAt: DateTime.parse(json["last_activity_at"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "uid_type": uidType,
        "email": email,
        "points": points,
        "total_points": totalPoints,
        "coins": List<dynamic>.from(coins.map((x) => x)),
        "total_coins": List<dynamic>.from(totalCoins.map((x) => x)),
        "state": state,
        "bad_email": badEmail,
        "email_verified": emailVerified,
        "cellphone_verified": cellphoneVerified,
        "unconfirmed_email": unconfirmedEmail,
        "unconfirmed_cellphone": unconfirmedCellphone,
        "avatar": avatar,
        "last_activity_at": lastActivityAt.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
