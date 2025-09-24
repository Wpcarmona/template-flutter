import 'dart:convert';

ExternalFormResponse externalFormResponseFromJson(String str) => ExternalFormResponse.fromJson(json.decode(str));

String externalFormResponseToJson(ExternalFormResponse data) => json.encode(data.toJson());

class ExternalFormResponse {
    String ok;
    DataExternalForm data;

    ExternalFormResponse({
        required this.ok,
        required this.data,
    });

    factory ExternalFormResponse.fromJson(Map<String, dynamic> json) => ExternalFormResponse(
        ok: json["ok"],
        data: DataExternalForm.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class DataExternalForm {
    int page;
    int pageSize;
    int totalPages;
    int totalData;
    List<External> externals;

    DataExternalForm({
        required this.page,
        required this.pageSize,
        required this.totalPages,
        required this.totalData,
        required this.externals,
    });

    factory DataExternalForm.fromJson(Map<String, dynamic> json) => DataExternalForm(
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        externals: List<External>.from(json["externals"].map((x) => External.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "externals": List<dynamic>.from(externals.map((x) => x.toJson())),
    };
}

class External {
    String id;
    int campaignLimit;
    String category;
    bool codesVaultLoader;
    String color;
    bool createFromPanel;
    int dailyLimit;
    dynamic description;
    bool enabled;
    bool fastImport;
    String formula;
    int globalCampaignLimit;
    int globalDailyLimit;
    bool moderationUpdate;
    String name;
    String slug;
    bool trackingAction;
    bool useAsForm;
    bool usePointType;
    bool usePrizeForm;
    bool useRetailForm;
    bool useSignupForm;
    dynamic iconUrl;
    String formId;
    dynamic pointType;
    dynamic pointTypeId;
    int createdAt;
    int updatedAt;
    List<dynamic> filter;

    External({
        required this.id,
        required this.campaignLimit,
        required this.category,
        required this.codesVaultLoader,
        required this.color,
        required this.createFromPanel,
        required this.dailyLimit,
        required this.description,
        required this.enabled,
        required this.fastImport,
        required this.formula,
        required this.globalCampaignLimit,
        required this.globalDailyLimit,
        required this.moderationUpdate,
        required this.name,
        required this.slug,
        required this.trackingAction,
        required this.useAsForm,
        required this.usePointType,
        required this.usePrizeForm,
        required this.useRetailForm,
        required this.useSignupForm,
        required this.iconUrl,
        required this.formId,
        required this.pointType,
        required this.pointTypeId,
        required this.createdAt,
        required this.updatedAt,
        required this.filter,
    });

    factory External.fromJson(Map<String, dynamic> json) => External(
        id: json["_id"],
        campaignLimit: json["campaign_limit"],
        category: json["category"],
        codesVaultLoader: json["codes_vault_loader"],
        color: json["color"],
        createFromPanel: json["create_from_panel"],
        dailyLimit: json["daily_limit"],
        description: json["description"],
        enabled: json["enabled"],
        fastImport: json["fast_import"],
        formula: json["formula"],
        globalCampaignLimit: json["global_campaign_limit"],
        globalDailyLimit: json["global_daily_limit"],
        moderationUpdate: json["moderation_update"],
        name: json["name"],
        slug: json["slug"],
        trackingAction: json["tracking_action"],
        useAsForm: json["use_as_form"],
        usePointType: json["use_point_type"],
        usePrizeForm: json["use_prize_form"],
        useRetailForm: json["use_retail_form"],
        useSignupForm: json["use_signup_form"],
        iconUrl: json["icon_url"],
        formId: json["form_id"],
        pointType: json["point_type"],
        pointTypeId: json["point_type_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        filter: List<dynamic>.from(json["filter"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "campaign_limit": campaignLimit,
        "category": category,
        "codes_vault_loader": codesVaultLoader,
        "color": color,
        "create_from_panel": createFromPanel,
        "daily_limit": dailyLimit,
        "description": description,
        "enabled": enabled,
        "fast_import": fastImport,
        "formula": formula,
        "global_campaign_limit": globalCampaignLimit,
        "global_daily_limit": globalDailyLimit,
        "moderation_update": moderationUpdate,
        "name": name,
        "slug": slug,
        "tracking_action": trackingAction,
        "use_as_form": useAsForm,
        "use_point_type": usePointType,
        "use_prize_form": usePrizeForm,
        "use_retail_form": useRetailForm,
        "use_signup_form": useSignupForm,
        "icon_url": iconUrl,
        "form_id": formId,
        "point_type": pointType,
        "point_type_id": pointTypeId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "filter": List<dynamic>.from(filter.map((x) => x)),
    };
}
