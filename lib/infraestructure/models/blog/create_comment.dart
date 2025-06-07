// To parse this JSON data, do
//
//     final createCommentResponse = createCommentResponseFromJson(jsonString);

import 'dart:convert';

CreateCommentResponse createCommentResponseFromJson(String str) => CreateCommentResponse.fromJson(json.decode(str));

String createCommentResponseToJson(CreateCommentResponse data) => json.encode(data.toJson());

class CreateCommentResponse {
    String ok;
    String activityState;
    int activityPoints;
    String message;
    String executionError;
    Object object;

    CreateCommentResponse({
        required this.ok,
        required this.activityState,
        required this.activityPoints,
        required this.message,
        required this.executionError,
        required this.object,
    });

    factory CreateCommentResponse.fromJson(Map<String, dynamic> json) => CreateCommentResponse(
        ok: json["ok"],
        activityState: json["activity_state"],
        activityPoints: json["activity_points"],
        message: json["message"],
        executionError: json["execution_error"],
        object: Object.fromJson(json["object"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "activity_state": activityState,
        "activity_points": activityPoints,
        "message": message,
        "execution_error": executionError,
        "object": object.toJson(),
    };
}

class Object {
    String id;
    String type;
    int activityCount;
    String atype;
    dynamic category;
    String moderation;
    int points;
    String state;
    int createdAt;
    int executeDate;
    String module;
    String name;
    dynamic team;
    dynamic pointType;
    CreateCommentParticipant participant;
    int votesCount;
    List<String> tags;
    List<String> participantsTags;
    dynamic pushRedirectUrl;

    Object({
        required this.id,
        required this.type,
        required this.activityCount,
        required this.atype,
        required this.category,
        required this.moderation,
        required this.points,
        required this.state,
        required this.createdAt,
        required this.executeDate,
        required this.module,
        required this.name,
        required this.team,
        required this.pointType,
        required this.participant,
        required this.votesCount,
        required this.tags,
        required this.participantsTags,
        required this.pushRedirectUrl,
    });

    factory Object.fromJson(Map<String, dynamic> json) => Object(
        id: json["_id"],
        type: json["_type"],
        activityCount: json["activity_count"],
        atype: json["atype"],
        category: json["category"],
        moderation: json["moderation"],
        points: json["points"],
        state: json["state"],
        createdAt: json["created_at"],
        executeDate: json["execute_date"],
        module: json["module"],
        name: json["name"],
        team: json["team"],
        pointType: json["point_type"],
        participant: CreateCommentParticipant.fromJson(json["participant"]),
        votesCount: json["votes_count"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        participantsTags: List<String>.from(json["participants_tags"].map((x) => x)),
        pushRedirectUrl: json["push_redirect_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "activity_count": activityCount,
        "atype": atype,
        "category": category,
        "moderation": moderation,
        "points": points,
        "state": state,
        "created_at": createdAt,
        "execute_date": executeDate,
        "module": module,
        "name": name,
        "team": team,
        "point_type": pointType,
        "participant": participant.toJson(),
        "votes_count": votesCount,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "participants_tags": List<dynamic>.from(participantsTags.map((x) => x)),
        "push_redirect_url": pushRedirectUrl,
    };
}

class CreateCommentParticipant {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    dynamic uidType;
    String state;

    CreateCommentParticipant({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory CreateCommentParticipant.fromJson(Map<String, dynamic> json) => CreateCommentParticipant(
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
