// To parse this JSON data, do
//
//     final getCommentsResponse = getCommentsResponseFromJson(jsonString);

import 'dart:convert';

GetCommentsResponse getCommentsResponseFromJson(String str) => GetCommentsResponse.fromJson(json.decode(str));

String getCommentsResponseToJson(GetCommentsResponse data) => json.encode(data.toJson());

class GetCommentsResponse {
    String ok;
    DataGetComments data;

    GetCommentsResponse({
        required this.ok,
        required this.data,
    });

    factory GetCommentsResponse.fromJson(Map<String, dynamic> json) => GetCommentsResponse(
        ok: json["ok"],
        data: DataGetComments.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class DataGetComments {
    int page;
    int pageSize;
    int totalPages;
    int totalData;
    List<Comment> comments;

    DataGetComments({
        required this.page,
        required this.pageSize,
        required this.totalPages,
        required this.totalData,
        required this.comments,
    });

    factory DataGetComments.fromJson(Map<String, dynamic> json) => DataGetComments(
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class Comment {
    String id;
    bool admin;
    bool archived;
    String atype;
    dynamic category;
    String executeDate;
    int extraPoints;
    String moderation;
    String ownerName;
    int points;
    String state;
    dynamic team;
    GetCommentsParticipant participant;
    dynamic editableBy;
    String deleteableBy;
    bool voted;
    String body;
    int createdAt;
    List<String> tags;
    List<String> participantsTags;
    dynamic pushRedirectUrl;

    Comment({
        required this.id,
        required this.admin,
        required this.archived,
        required this.atype,
        required this.category,
        required this.executeDate,
        required this.extraPoints,
        required this.moderation,
        required this.ownerName,
        required this.points,
        required this.state,
        required this.team,
        required this.participant,
        required this.editableBy,
        required this.deleteableBy,
        required this.voted,
        required this.body,
        required this.createdAt,
        required this.tags,
        required this.participantsTags,
        required this.pushRedirectUrl,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["_id"],
        admin: json["admin"],
        archived: json["archived"],
        atype: json["atype"],
        category: json["category"],
        executeDate: json["execute_date"],
        extraPoints: json["extra_points"],
        moderation: json["moderation"],
        ownerName: json["owner_name"],
        points: json["points"],
        state: json["state"],
        team: json["team"],
        participant: GetCommentsParticipant.fromJson(json["participant"]),
        editableBy: json["editable_by"],
        deleteableBy: json["deleteable_by"],
        voted: json["voted"],
        body: json["body"],
        createdAt: json["created_at"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        participantsTags: List<String>.from(json["participants_tags"].map((x) => x)),
        pushRedirectUrl: json["push_redirect_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "admin": admin,
        "archived": archived,
        "atype": atype,
        "category": category,
        "execute_date": executeDate,
        "extra_points": extraPoints,
        "moderation": moderation,
        "owner_name": ownerName,
        "points": points,
        "state": state,
        "team": team,
        "participant": participant.toJson(),
        "editable_by": editableBy,
        "deleteable_by": deleteableBy,
        "voted": voted,
        "body": body,
        "created_at": createdAt,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "participants_tags": List<dynamic>.from(participantsTags.map((x) => x)),
        "push_redirect_url": pushRedirectUrl,
    };
}

class GetCommentsParticipant {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    dynamic uidType;
    String state;

    GetCommentsParticipant({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory GetCommentsParticipant.fromJson(Map<String, dynamic> json) => GetCommentsParticipant(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        uid: json["uid"],
        uidType: json["uid_type"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "avatar": avatar,
        "uid": uid,
        "uid_type": uidType,
        "state": state,
    };
}
