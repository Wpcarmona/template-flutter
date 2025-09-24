// To parse this JSON data, do
//
//     final createBlogResponse = createBlogResponseFromJson(jsonString);

import 'dart:convert';

CreateBlogResponse createBlogResponseFromJson(String str) => CreateBlogResponse.fromJson(json.decode(str));

String createBlogResponseToJson(CreateBlogResponse data) => json.encode(data.toJson());

class CreateBlogResponse {
    String ok;
    String activityState;
    int activityPoints;
    String message;
    String executionError;
    ObjectCreateBlog object;

    CreateBlogResponse({
        required this.ok,
        required this.activityState,
        required this.activityPoints,
        required this.message,
        required this.executionError,
        required this.object,
    });

    factory CreateBlogResponse.fromJson(Map<String, dynamic> json) => CreateBlogResponse(
        ok: json["ok"],
        activityState: json["activity_state"],
        activityPoints: json["activity_points"],
        message: json["message"],
        executionError: json["execution_error"],
        object: ObjectCreateBlog.fromJson(json["object"]),
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

class ObjectCreateBlog {
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
    CreateBlogparticipant participant;
    int votesCount;
    String title;
    String format;
    List<dynamic> tags;
    List<dynamic> participantsTags;
    List<dynamic> files;
    dynamic pushRedirectUrl;

    ObjectCreateBlog({
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
        required this.title,
        required this.format,
        required this.tags,
        required this.participantsTags,
        required this.files,
        required this.pushRedirectUrl,
    });

    factory ObjectCreateBlog.fromJson(Map<String, dynamic> json) => ObjectCreateBlog(
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
        participant: CreateBlogparticipant.fromJson(json["participant"]),
        votesCount: json["votes_count"],
        title: json["title"],
        format: json["format"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        participantsTags: List<dynamic>.from(json["participants_tags"].map((x) => x)),
        files: List<dynamic>.from(json["files"].map((x) => x)),
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
        "title": title,
        "format": format,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "participants_tags": List<dynamic>.from(participantsTags.map((x) => x)),
        "files": List<dynamic>.from(files.map((x) => x)),
        "push_redirect_url": pushRedirectUrl,
    };
}

class CreateBlogparticipant {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    dynamic uidType;
    String state;

    CreateBlogparticipant({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory CreateBlogparticipant.fromJson(Map<String, dynamic> json) => CreateBlogparticipant(
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
