// To parse this JSON data, do
//
//     final getChallengesResponse = getChallengesResponseFromJson(jsonString);
import 'dart:convert';

GetGoalsResponse getChallengesResponseFromJson(String str) => GetGoalsResponse.fromJson(json.decode(str));

String getChallengesResponseToJson(GetGoalsResponse data) => json.encode(data.toJson());

class GetGoalsResponse {
    String ok;
    Data data;

    GetGoalsResponse({
        required this.ok,
        required this.data,
    });

    factory GetGoalsResponse.fromJson(Map<String, dynamic> json) => GetGoalsResponse(
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
    List<GoalStatus> goalStatuses;

    Data({
        required this.page,
        required this.pageSize,
        required this.totalPages,
        required this.totalData,
        required this.goalStatuses,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        goalStatuses: List<GoalStatus>.from(json["goal_statuses"].map((x) => GoalStatus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "goal_statuses": List<dynamic>.from(goalStatuses.map((x) => x.toJson())),
    };
}

class GoalStatus {
    String id;
    String createdAt;
    String goalId;
    String participationId;
    String status;
    String updatedAt;
    int winned;
    List<dynamic> winningDates;
    String activityTarget;
    int activityTimes;
    bool deleted;
    String desc;
    bool enabled;
    String endsAt;
    String formula;
    bool giveNormalPoints;
    Image image;
    String interval;
    int intervalSamples;
    int limit;
    String name;
    String period;
    String pocketId;
    bool recurrent;
    String rewardType;
    dynamic secondaryPocketId;
    dynamic secondaryRewardId;
    dynamic secondaryRewardType;
    dynamic secondarySponsorId;
    int secondarySponsorPercentage;
    String sponsorId;
    int sponsorPercentage;
    String startsAt;
    List<String> tags;
    String rewardName;
    String periodBegins;
    String periodEnds;

    GoalStatus({
        required this.id,
        required this.createdAt,
        required this.goalId,
        required this.participationId,
        required this.status,
        required this.updatedAt,
        required this.winned,
        required this.winningDates,
        required this.activityTarget,
        required this.activityTimes,
        required this.deleted,
        required this.desc,
        required this.enabled,
        required this.endsAt,
        required this.formula,
        required this.giveNormalPoints,
        required this.image,
        required this.interval,
        required this.intervalSamples,
        required this.limit,
        required this.name,
        required this.period,
        required this.pocketId,
        required this.recurrent,
        required this.rewardType,
        required this.secondaryPocketId,
        required this.secondaryRewardId,
        required this.secondaryRewardType,
        required this.secondarySponsorId,
        required this.secondarySponsorPercentage,
        required this.sponsorId,
        required this.sponsorPercentage,
        required this.startsAt,
        required this.tags,
        required this.rewardName,
        required this.periodBegins,
        required this.periodEnds,
    });

    factory GoalStatus.fromJson(Map<String, dynamic> json) => GoalStatus(
        id: json["_id"],
        createdAt: json["created_at"],
        goalId: json["goal_id"],
        participationId: json["participation_id"],
        status: json["status"],
        updatedAt:  json["updated_at"],
        winned: json["winned"],
        winningDates: List<dynamic>.from(json["winning_dates"].map((x) => x)),
        activityTarget: json["activity_target"],
        activityTimes: json["activity_times"],
        deleted: json["deleted"],
        desc: json["desc"],
        enabled: json["enabled"],
        endsAt:   json["ends_at"] ?? "",
        formula: json["formula"],
        giveNormalPoints: json["give_normal_points"],
        image: Image.fromJson(json["image"]),
        interval: json["interval"],
        intervalSamples: json["interval_samples"],
        limit: json["limit"],
        name: json["name"],
        period: json["period"],
        pocketId: json["pocket_id"] ?? "",
        recurrent: json["recurrent"],
        rewardType: json["reward_type"] ?? "",
        secondaryPocketId: json["secondary_pocket_id"],
        secondaryRewardId: json["secondary_reward_id"],
        secondaryRewardType: json["secondary_reward_type"],
        secondarySponsorId: json["secondary_sponsor_id"],
        secondarySponsorPercentage: json["secondary_sponsor_percentage"],
        sponsorId: json["sponsor_id"] ?? "",
        sponsorPercentage: json["sponsor_percentage"],
        startsAt: json["starts_at"] ?? "",
        tags: List<String>.from(json["tags"].map((x) => x)),
        rewardName: json["reward_name"] ?? "",
        periodBegins: json["period_begins"] ?? "",
        periodEnds: json["period_ends"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "created_at": createdAt,
        "goal_id": goalId,
        "participation_id": participationId,
        "status": status,
        "updated_at": updatedAt,
        "winned": winned,
        "winning_dates": List<dynamic>.from(winningDates.map((x) => x)),
        "activity_target": activityTarget,
        "activity_times": activityTimes,
        "deleted": deleted,
        "desc": desc,
        "enabled": enabled,
        "ends_at": endsAt,
        "formula": formula,
        "give_normal_points": giveNormalPoints,
        "image": image.toJson(),
        "interval": interval,
        "interval_samples": intervalSamples,
        "limit": limit,
        "name": name,
        "period": period,
        "pocket_id": pocketId,
        "recurrent": recurrent,
        "reward_type": rewardType,
        "secondary_pocket_id": secondaryPocketId,
        "secondary_reward_id": secondaryRewardId,
        "secondary_reward_type": secondaryRewardType,
        "secondary_sponsor_id": secondarySponsorId,
        "secondary_sponsor_percentage": secondarySponsorPercentage,
        "sponsor_id": sponsorId,
        "sponsor_percentage": sponsorPercentage,
        "starts_at": startsAt,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "reward_name": rewardName,
        "period_begins": periodBegins,
        "period_ends": periodEnds,
    };
}

class Image {
    String url;

    Image({
        required this.url,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
