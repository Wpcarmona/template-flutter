// To parse this JSON data, do
//
//     final votedBlogResponse = votedBlogResponseFromJson(jsonString);

import 'dart:convert';

VotedBlogResponse votedBlogResponseFromJson(String str) => VotedBlogResponse.fromJson(json.decode(str));

String votedBlogResponseToJson(VotedBlogResponse data) => json.encode(data.toJson());

class VotedBlogResponse {
    String ok;
    String message;

    VotedBlogResponse({
        required this.ok,
        required this.message,
    });

    factory VotedBlogResponse.fromJson(Map<String, dynamic> json) => VotedBlogResponse(
        ok: json["ok"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
