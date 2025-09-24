// To parse this JSON data, do
//
//     final rewardsResponse = rewardsResponseFromJson(jsonString);

import 'dart:convert';

RewardsResponse rewardsResponseFromJson(String str) =>
    RewardsResponse.fromJson(json.decode(str));

String rewardsResponseToJson(RewardsResponse data) =>
    json.encode(data.toJson());

class RewardsResponse {
  String ok;
  int page;
  int pageSize;
  int totalPages;
  int totalData;
  List<DatasReward> object;

  RewardsResponse({
    required this.ok,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.object,
  });

  factory RewardsResponse.fromJson(Map<String, dynamic> json) =>
      RewardsResponse(
        ok: json["ok"],
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        object: List<DatasReward>.from(
            json["object"].map((x) => DatasReward.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "object": List<dynamic>.from(object.map((x) => x.toJson())),
      };
}

class DatasReward {
  String id;
  String type;
  String category;
  String description;
  int expirationDays;
  String name;
  int points;
  String prizeImageUrl;
  dynamic quantity;
  bool redeemable;
  bool requireRedemptionToken;
  List<String> tags;
  String tc;
  bool unlimited;
  bool usePointType;
  int userLimit;
  String userLimitTimeframe;
  List<dynamic> filter;
  int quantityAvailable;
  String imageUrl;
  String pointType;
  String pointTypeId;
  String sponsor;
  String sponsorId;

  /// Opcionales
  List<String>? customData;
  String? addonId;
  MetadataReward? metadata;

  String eid;
  bool available;
  bool isExternalCouponPrize;
  String redeemUrl;

  DatasReward({
    required this.id,
    required this.type,
    required this.category,
    required this.description,
    required this.expirationDays,
    required this.name,
    required this.points,
    required this.prizeImageUrl,
    required this.quantity,
    required this.redeemable,
    required this.requireRedemptionToken,
    required this.tags,
    required this.tc,
    required this.unlimited,
    required this.usePointType,
    required this.userLimit,
    required this.userLimitTimeframe,
    required this.filter,
    required this.quantityAvailable,
    required this.imageUrl,
    required this.pointType,
    required this.pointTypeId,
    required this.sponsor,
    required this.sponsorId,
    required this.eid,
    required this.available,
    required this.isExternalCouponPrize,
    required this.redeemUrl,
    this.customData,
    this.addonId,
    this.metadata,
  });

  factory DatasReward.fromJson(Map<String, dynamic> json) => DatasReward(
        id: json["_id"],
        type: json["_type"],
        category: json["category"],
        description: json["description"],
        expirationDays: json["expiration_days"],
        name: json["name"],
        points: json["points"],
        prizeImageUrl: json["prize_image_url"],
        quantity: json["quantity"],
        redeemable: json["redeemable"],
        requireRedemptionToken: json["require_redemption_token"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        tc: json["tc"],
        unlimited: json["unlimited"],
        usePointType: json["use_point_type"],
        userLimit: json["user_limit"],
        userLimitTimeframe: json["user_limit_timeframe"],
        filter: List<dynamic>.from(json["filter"].map((x) => x)),
        quantityAvailable: json["quantity_available"],
        imageUrl: json["image_url"] ?? "",
        pointType: json["point_type"] ?? "",
        pointTypeId: json["point_type_id"] ?? "",
        sponsor: json["sponsor"],
        sponsorId: json["sponsor_id"],

        /// Manejo opcionales
        customData: json["custom_data"] != null
            ? List<String>.from(json["custom_data"].map((x) => x))
            : null,
        addonId: json["addon_id"],
        metadata: json["metadata"] != null
            ? MetadataReward.fromJson(json["metadata"])
            : null,

        eid: json["eid"],
        available: json["available"],
        isExternalCouponPrize: json["is_external_coupon_prize"] ?? false,
        redeemUrl: json["redeem_url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "category": category,
        "description": description,
        "expiration_days": expirationDays,
        "name": name,
        "points": points,
        "prize_image_url": prizeImageUrl,
        "quantity": quantity,
        "redeemable": redeemable,
        "require_redemption_token": requireRedemptionToken,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "tc": tc,
        "unlimited": unlimited,
        "use_point_type": usePointType,
        "user_limit": userLimit,
        "user_limit_timeframe": userLimitTimeframe,
        "filter": List<dynamic>.from(filter.map((x) => x)),
        "quantity_available": quantityAvailable,
        "image_url": imageUrl,
        "point_type": pointType,
        "point_type_id": pointTypeId,
        "sponsor": sponsor,
        "sponsor_id": sponsorId,
        "eid": eid,
        "available": available,
        "is_external_coupon_prize": isExternalCouponPrize,
        "redeem_url": redeemUrl,
        if (customData != null)
          "custom_data": List<dynamic>.from(customData!.map((x) => x)),
        if (addonId != null) "addon_id": addonId,
        if (metadata != null) "metadata": metadata!.toJson(),
      };
}

class MetadataReward {
 
  int? productId;
  String? name;
  String? description;
  String? condiciones;
  String? image;
  int? pvp;
  String? brandId;
  String? brandName;
  String? catl1;
  String? catl2;
  dynamic catl3;
  int? silver;
  List<BrandReward> brands;       

  int? localizable;
  List<String>? cities;

  MetadataReward({
    this.productId,
    this.name,
    this.description,
    this.condiciones,
    this.image,
    this.pvp,
    this.brandId,
    this.brandName,
    this.catl1,
    this.catl2,
    this.catl3,
    this.silver,
    List<BrandReward>? brands,
    this.localizable,
    this.cities,
  }) : brands = brands ?? const [];

  factory MetadataReward.fromJson(Map<String, dynamic> json) => MetadataReward(
        productId: _toInt(json["product_id"]),
        name: json["name"] as String?,
        description: json["description"] as String?,
        condiciones: json["condiciones"] as String?,
        image: json["image"] as String?,
        pvp: _toInt(json["pvp"]),
        brandId: json["brand_id"] as String?,
        brandName: json["brand_name"] as String?,
        catl1: json["catl1"] as String?,
        catl2: json["catl2"] as String?,
        catl3: json["catl3"],
        silver: _toInt(json["silver"]),
        brands: (json["brands"] as List?)
                ?.map((e) => BrandReward.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
        localizable: _toInt(json["localizable"]),
        cities: (json["cities"] as List?)
            ?.map((e) => e?.toString() ?? '')
            .where((e) => e.isNotEmpty)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (productId != null) "product_id": productId,
        if (name != null) "name": name,
        if (description != null) "description": description,
        if (condiciones != null) "condiciones": condiciones,
        if (image != null) "image": image,
        if (pvp != null) "pvp": pvp,
        if (brandId != null) "brand_id": brandId,
        if (brandName != null) "brand_name": brandName,
        if (catl1 != null) "catl1": catl1,
        if (catl2 != null) "catl2": catl2,
        "catl3": catl3, // si quieres omitir cuando sea null, usa: if (catl3 != null) "catl3": catl3,
        if (silver != null) "silver": silver,
        // Siempre serializamos brands (puede ser lista vacía)
        "brands": brands.map((x) => x.toJson()).toList(),
        if (localizable != null) "localizable": localizable,
        if (cities != null) "cities": cities,
      };

  // helper para convertir a int tolerante (int/double/String/null)
  static int? _toInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v);
    return null;
    }
}

class BrandReward {
  int? brandId;
  String? name;

  BrandReward({this.brandId, this.name});

  factory BrandReward.fromJson(Map<String, dynamic> json) => BrandReward(
        brandId: MetadataReward._toInt(json["brand_id"]),
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (brandId != null) "brand_id": brandId,
        if (name != null) "name": name,
      };
}