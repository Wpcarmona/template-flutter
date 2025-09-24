import 'dart:convert';

GoalIndexResponse goalIndexResponseFromJson(String str) =>
    GoalIndexResponse.fromJson(json.decode(str));

String goalIndexResponseToJson(GoalIndexResponse data) =>
    json.encode(data.toJson());

class GoalIndexResponse {
  String ok;
  Data data;

  GoalIndexResponse({
    required this.ok,
    required this.data,
  });

  factory GoalIndexResponse.fromJson(Map<String, dynamic> json) =>
      GoalIndexResponse(
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
  List<Goal> goals;

  Data({
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.goals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        goals: List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
      };
}

class Goal {
  String id;
  String activityTarget;
  int activityTimes;
  String brandId;
  String campaignId;
  DateTime createdAt;
  bool deleted;
  String desc;
  bool enabled;
  DateTime endsAt;
  String formula;
  bool giveNormalPoints;
  Image image;
  String interval;
  int intervalSamples;
  int limit;
  String name;
  dynamic participantMetricId;
  dynamic participantMetricTimeframe;
  dynamic participantMetricValue;
  String period;
  String pocketId;
  bool recurrent;
  String rewardId;
  String rewardType;
  int secondaryMetricExtraPercentage;
  dynamic secondaryParticipantMetricId;
  dynamic secondaryParticipantMetricTimeframe;
  dynamic secondaryPocketId;
  dynamic secondaryRewardId;
  dynamic secondaryRewardType;
  dynamic secondarySponsorId;
  int secondarySponsorPercentage;
  String sponsorId;
  int sponsorPercentage;
  DateTime startsAt;
  List<String> tags;
  DateTime updatedAt;
  bool useParticipantMetrics;
  List<Filter> filter;
  List<ParticipantFilter> participantFilter;
  String rewardName;
  String sponsorName;
  String pocketName;
  dynamic secondaryRewardName;
  dynamic secondarySponsorName;
  dynamic secondaryPocketName;
  dynamic participantMetricName;
  dynamic secondaryParticipantMetricName;
  DateTime? startPeriod;
  DateTime? endPeriod;

  Goal({
    required this.id,
    required this.activityTarget,
    required this.activityTimes,
    required this.brandId,
    required this.campaignId,
    required this.createdAt,
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
    required this.participantMetricId,
    required this.participantMetricTimeframe,
    required this.participantMetricValue,
    required this.period,
    required this.pocketId,
    required this.recurrent,
    required this.rewardId,
    required this.rewardType,
    required this.secondaryMetricExtraPercentage,
    required this.secondaryParticipantMetricId,
    required this.secondaryParticipantMetricTimeframe,
    required this.secondaryPocketId,
    required this.secondaryRewardId,
    required this.secondaryRewardType,
    required this.secondarySponsorId,
    required this.secondarySponsorPercentage,
    required this.sponsorId,
    required this.sponsorPercentage,
    required this.startsAt,
    required this.tags,
    required this.updatedAt,
    required this.useParticipantMetrics,
    required this.filter,
    required this.participantFilter,
    required this.rewardName,
    required this.sponsorName,
    required this.pocketName,
    required this.secondaryRewardName,
    required this.secondarySponsorName,
    required this.secondaryPocketName,
    required this.participantMetricName,
    required this.secondaryParticipantMetricName,
    this.startPeriod,
    this.endPeriod,
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        id: json["_id"],
        activityTarget: json["activity_target"],
        activityTimes: json["activity_times"],
        brandId: json["brand_id"],
        campaignId: json["campaign_id"],
        createdAt: DateTime.parse(json["created_at"]),
        deleted: json["deleted"],
        desc: json["desc"],
        enabled: json["enabled"],
        endsAt: DateTime.parse(json["ends_at"]),
        formula: json["formula"],
        giveNormalPoints: json["give_normal_points"],
        image: Image.fromJson(json["image"]),
        interval: json["interval"],
        intervalSamples: json["interval_samples"],
        limit: json["limit"],
        name: json["name"],
        participantMetricId: json["participant_metric_id"],
        participantMetricTimeframe: json["participant_metric_timeframe"],
        participantMetricValue: json["participant_metric_value"],
        period: json["period"],
        pocketId: json["pocket_id"] ?? "",
        recurrent: json["recurrent"],
        rewardId: json["reward_id"] ?? "",
        rewardType: json["reward_type"] ?? "",
        secondaryMetricExtraPercentage:
            json["secondary_metric_extra_percentage"],
        secondaryParticipantMetricId: json["secondary_participant_metric_id"],
        secondaryParticipantMetricTimeframe:
            json["secondary_participant_metric_timeframe"],
        secondaryPocketId: json["secondary_pocket_id"],
        secondaryRewardId: json["secondary_reward_id"],
        secondaryRewardType: json["secondary_reward_type"],
        secondarySponsorId: json["secondary_sponsor_id"],
        secondarySponsorPercentage: json["secondary_sponsor_percentage"],
        sponsorId: json["sponsor_id"] ?? "",
        sponsorPercentage: json["sponsor_percentage"],
        startsAt: DateTime.parse(json["starts_at"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        updatedAt: DateTime.parse(json["updated_at"]),
        useParticipantMetrics: json["use_participant_metrics"],
        filter:
            List<Filter>.from(json["filter"].map((x) => Filter.fromJson(x))),
        participantFilter: List<ParticipantFilter>.from(
            json["participant_filter"]
                .map((x) => ParticipantFilter.fromJson(x))),
        rewardName: json["reward_name"] ?? "",
        sponsorName: json["sponsor_name"] ?? "",
        pocketName: json["pocket_name"] ?? "",
        secondaryRewardName: json["secondary_reward_name"],
        secondarySponsorName: json["secondary_sponsor_name"],
        secondaryPocketName: json["secondary_pocket_name"],
        participantMetricName: json["participant_metric_name"],
        secondaryParticipantMetricName:
            json["secondary_participant_metric_name"],
        startPeriod: DateTime.tryParse((json["start_period"] ?? '').toString()),
        endPeriod: DateTime.tryParse((json["end_period"] ?? '').toString()),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "activity_target": activityTarget,
        "activity_times": activityTimes,
        "brand_id": brandId,
        "campaign_id": campaignId,
        "created_at": createdAt.toIso8601String(),
        "deleted": deleted,
        "desc": desc,
        "enabled": enabled,
        "ends_at": endsAt.toIso8601String(),
        "formula": formula,
        "give_normal_points": giveNormalPoints,
        "image": image.toJson(),
        "interval": interval,
        "interval_samples": intervalSamples,
        "limit": limit,
        "name": name,
        "participant_metric_id": participantMetricId,
        "participant_metric_timeframe": participantMetricTimeframe,
        "participant_metric_value": participantMetricValue,
        "period": period,
        "pocket_id": pocketId,
        "recurrent": recurrent,
        "reward_id": rewardId,
        "reward_type": rewardType,
        "secondary_metric_extra_percentage": secondaryMetricExtraPercentage,
        "secondary_participant_metric_id": secondaryParticipantMetricId,
        "secondary_participant_metric_timeframe":
            secondaryParticipantMetricTimeframe,
        "secondary_pocket_id": secondaryPocketId,
        "secondary_reward_id": secondaryRewardId,
        "secondary_reward_type": secondaryRewardType,
        "secondary_sponsor_id": secondarySponsorId,
        "secondary_sponsor_percentage": secondarySponsorPercentage,
        "sponsor_id": sponsorId,
        "sponsor_percentage": sponsorPercentage,
        "starts_at": startsAt.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "updated_at": updatedAt.toIso8601String(),
        "use_participant_metrics": useParticipantMetrics,
        "filter": List<dynamic>.from(filter.map((x) => x.toJson())),
        "participant_filter":
            List<dynamic>.from(participantFilter.map((x) => x.toJson())),
        "reward_name": rewardName,
        "sponsor_name": sponsorName,
        "pocket_name": pocketName,
        "secondary_reward_name": secondaryRewardName,
        "secondary_sponsor_name": secondarySponsorName,
        "secondary_pocket_name": secondaryPocketName,
        "participant_metric_name": participantMetricName,
        "secondary_participant_metric_name": secondaryParticipantMetricName,
        "start_period": startPeriod?.toIso8601String(),
        "end_period": endPeriod?.toIso8601String(),
      };
}

class Filter {
  String id;
  String field;
  String filterOperator;
  dynamic val;

  Filter({
    required this.id,
    required this.field,
    required this.filterOperator,
    required this.val,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        id: json["_id"],
        field: json["field"],
        filterOperator: json["operator"],
        val: json["val"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "field": field,
        "operator": filterOperator,
        "val": val,
      };
}

class Image {
  String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class ParticipantFilter {
  String id;
  String field;
  String participantFilterOperator;
  List<String> val;

  ParticipantFilter({
    required this.id,
    required this.field,
    required this.participantFilterOperator,
    required this.val,
  });

  factory ParticipantFilter.fromJson(Map<String, dynamic> json) =>
      ParticipantFilter(
        id: json["_id"],
        field: json["field"],
        participantFilterOperator: json["operator"],
        val: List<String>.from(json["val"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "field": field,
        "operator": participantFilterOperator,
        "val": List<dynamic>.from(val.map((x) => x)),
      };
}
