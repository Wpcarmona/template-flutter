// To parse this JSON data, do
//
//     final blogResponse = blogResponseFromJson(jsonString);

import 'dart:convert';

BlogResponse blogResponseFromJson(String str) => BlogResponse.fromJson(json.decode(str));

String blogResponseToJson(BlogResponse data) => json.encode(data.toJson());

class BlogResponse {
    String ok;
    Data data;

    BlogResponse({
        required this.ok,
        required this.data,
    });

    factory BlogResponse.fromJson(Map<String, dynamic> json) => BlogResponse(
        ok: json["ok"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class Data {
    int page;
    int pageSize;
    int totalPages;
    int totalData;
    List<BlogPost> blogPosts;

    Data({
        required this.page,
        required this.pageSize,
        required this.totalPages,
        required this.totalData,
        required this.blogPosts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        blogPosts: List<BlogPost>.from(json["blog_posts"].map((x) => BlogPost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "blog_posts": List<dynamic>.from(blogPosts.map((x) => x.toJson())),
    };
}

class BlogPost {
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
    Blogparticipant participant;
    String permalink;
    dynamic shortUrl;
    dynamic facebookTabUrl;
    int votesCount;
    int votesAverage;
    int votesUp;
    int votesDown;
    String title;
    String body;
    dynamic editableBy;
    dynamic deleteableBy;
    bool voted;
    int createdAt;
    String format;
    List<String> tags;
    List<String> participantsTags;

    BlogPost({
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
        required this.permalink,
        required this.shortUrl,
        required this.facebookTabUrl,
        required this.votesCount,
        required this.votesAverage,
        required this.votesUp,
        required this.votesDown,
        required this.title,
        required this.body,
        required this.editableBy,
        required this.deleteableBy,
        required this.voted,
        required this.createdAt,
        required this.format,
        required this.tags,
        required this.participantsTags,
    });

    factory BlogPost.fromJson(Map<String, dynamic> json) => BlogPost(
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
        participant: Blogparticipant.fromJson(json["participant"]),
        permalink: json["permalink"],
        shortUrl: json["short_url"],
        facebookTabUrl: json["facebook_tab_url"],
        votesCount: json["votes_count"],
        votesAverage: json["votes_average"],
        votesUp: json["votes_up"],
        votesDown: json["votes_down"],
        title: json["title"],
        body: json["body"],
        editableBy: json["editable_by"],
        deleteableBy: json["deleteable_by"],
        voted: json["voted"],
        createdAt: json["created_at"],
        format: json["format"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        participantsTags: List<String>.from(json["participants_tags"].map((x) => x)),
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
        "permalink": permalink,
        "short_url": shortUrl,
        "facebook_tab_url": facebookTabUrl,
        "votes_count": votesCount,
        "votes_average": votesAverage,
        "votes_up": votesUp,
        "votes_down": votesDown,
        "title": title,
        "body": body,
        "editable_by": editableBy,
        "deleteable_by": deleteableBy,
        "voted": voted,
        "created_at": createdAt,
        "format": format,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "participants_tags": List<dynamic>.from(participantsTags.map((x) => x)),
    };
}

class Blogparticipant {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    dynamic uidType;
    String state;

    Blogparticipant({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory Blogparticipant.fromJson(Map<String, dynamic> json) => Blogparticipant(
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
