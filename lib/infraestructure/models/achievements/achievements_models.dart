import 'dart:convert';

GetAchievementsResponse getAchievementsResponseFromJson(String str) => GetAchievementsResponse.fromJson(json.decode(str));

String getAchievementsResponseToJson(GetAchievementsResponse data) => json.encode(data.toJson());

class GetAchievementsResponse {
    String ok;
    Data data;

    GetAchievementsResponse({
        required this.ok,
        required this.data,
    });

    factory GetAchievementsResponse.fromJson(Map<String, dynamic> json) => GetAchievementsResponse(
        ok: json["ok"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class Data {
    double previousPageToken;
    double nextPageToken;
    List<Achievement> achievements;

    Data({
        required this.previousPageToken,
        required this.nextPageToken,
        required this.achievements,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        previousPageToken: json["previous_page_token"]?.toDouble(),
        nextPageToken: json["next_page_token"]?.toDouble(),
        achievements: List<Achievement>.from(json["achievements"].map((x) => Achievement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "previous_page_token": previousPageToken,
        "next_page_token": nextPageToken,
        "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
    };
}

class Achievement {
    String id;
    String type;
    String state;
    List<String> tags;
    String createdAt;
    ParticipantAchievement participant;
    List<String> activityFilter;
    String activityTarget;
    List<dynamic> participantFilter;
    String period;
    String rewardName;
    String rewardType;
    dynamic secondaryRewardName;
    dynamic totalPrimaryReward;
    int totalReward;
    dynamic totalSecondaryReward;
    String goalStartPeriod;
    String goalEndPeriod;
    String goalId;
    String goalName;
    String goalImageUrl;

    Achievement({
        required this.id,
        required this.type,
        required this.state,
        required this.tags,
        required this.createdAt,
        required this.participant,
        required this.activityFilter,
        required this.activityTarget,
        required this.participantFilter,
        required this.period,
        required this.rewardName,
        required this.rewardType,
        required this.secondaryRewardName,
        required this.totalPrimaryReward,
        required this.totalReward,
        required this.totalSecondaryReward,
        required this.goalStartPeriod,
        required this.goalEndPeriod,
        required this.goalId,
        required this.goalName,
        required this.goalImageUrl,
    });

    factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        id: json["_id"],
        type: json["_type"],
        state: json["state"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        createdAt:json["created_at"],
        participant: ParticipantAchievement.fromJson(json["participant"]),
        activityFilter: List<String>.from(json["activity_filter"].map((x) => x)),
        activityTarget: json["activity_target"],
        participantFilter: List<dynamic>.from(json["participant_filter"].map((x) => x)),
        period: json["period"],
        rewardName: json["reward_name"],
        rewardType: json["reward_type"],
        secondaryRewardName: json["secondary_reward_name"],
        totalPrimaryReward: json["total_primary_reward"],
        totalReward: json["total_reward"],
        totalSecondaryReward: json["total_secondary_reward"],
        goalStartPeriod: json["goal_start_period"] ?? "",
        goalEndPeriod: json["goal_end_period"] ?? "",
        goalId: json["goal_id"],
        goalName: json["goal_name"],
        goalImageUrl: json["goal_image_url"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "state": state,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "created_at": createdAt,
        "participant": participant.toJson(),
        "activity_filter": List<dynamic>.from(activityFilter.map((x) => x)),
        "activity_target": activityTarget,
        "participant_filter": List<dynamic>.from(participantFilter.map((x) => x)),
        "period": period,
        "reward_name": rewardName,
        "reward_type": rewardType,
        "secondary_reward_name": secondaryRewardName,
        "total_primary_reward": totalPrimaryReward,
        "total_reward": totalReward,
        "total_secondary_reward": totalSecondaryReward,
        "goal_start_period": goalStartPeriod,
        "goal_end_period": goalEndPeriod,
        "goal_id": goalId,
        "goal_name": goalName,
        "goal_image_url": goalImageUrl,
    };
}

class ParticipantAchievement {
    String name;
    String id;
    String uid;
    String email;

    ParticipantAchievement({
        required this.name,
        required this.id,
        required this.uid,
        required this.email,
    });

    factory ParticipantAchievement.fromJson(Map<String, dynamic> json) => ParticipantAchievement(
        name: json["name"],
        id: json["id"],
        uid: json["uid"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "uid": uid,
        "email": email,
    };
}
