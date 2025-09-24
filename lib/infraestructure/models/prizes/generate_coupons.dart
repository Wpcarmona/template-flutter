
import 'dart:convert';

GenerateCouponResponse generateCouponResponseFromJson(String str) => GenerateCouponResponse.fromJson(json.decode(str));

String generateCouponResponseToJson(GenerateCouponResponse data) => json.encode(data.toJson());

class GenerateCouponResponse {
    String ok;
    ObjectGenerateCoupons object;

    GenerateCouponResponse({
        required this.ok,
        required this.object,
    });

    factory GenerateCouponResponse.fromJson(Map<String, dynamic> json) => GenerateCouponResponse(
        ok: json["ok"],
        object: ObjectGenerateCoupons.fromJson(json["object"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "object": object.toJson(),
    };
}

class ObjectGenerateCoupons {
    Coupon coupon;
    Redemption redemption;
    String message;

    ObjectGenerateCoupons({
        required this.coupon,
        required this.redemption,
        required this.message,
    });

    factory ObjectGenerateCoupons.fromJson(Map<String, dynamic> json) => ObjectGenerateCoupons(
        coupon: Coupon.fromJson(json["coupon"]),
        redemption: Redemption.fromJson(json["redemption"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "coupon": coupon.toJson(),
        "redemption": redemption.toJson(),
        "message": message,
    };
}

class Coupon {
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
    String eid;
    String addonId;
    Metadata metadata;
    bool available;
    bool isExternalCouponPrize;
    String redeemUrl;

    Coupon({
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
        required this.addonId,
        required this.metadata,
        required this.available,
        required this.isExternalCouponPrize,
        required this.redeemUrl,
    });

    factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
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
        imageUrl: json["image_url"],
        pointType: json["point_type"],
        pointTypeId: json["point_type_id"],
        sponsor: json["sponsor"],
        sponsorId: json["sponsor_id"],
        eid: json["eid"],
        addonId: json["addon_id"],
        metadata: Metadata.fromJson(json["metadata"]),
        available: json["available"],
        isExternalCouponPrize: json["is_external_coupon_prize"],
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
        "addon_id": addonId,
        "metadata": metadata.toJson(),
        "available": available,
        "is_external_coupon_prize": isExternalCouponPrize,
        "redeem_url": redeemUrl,
    };
}

class Metadata {
    int productId;
    String name;
    String description;
    String condiciones;
    String image;
    int pvp;
    String brandId;
    String brandName;
    String catl1;
    String catl2;
    dynamic catl3;
    int silver;
    List<Brand> brands;

    Metadata({
        required this.productId,
        required this.name,
        required this.description,
        required this.condiciones,
        required this.image,
        required this.pvp,
        required this.brandId,
        required this.brandName,
        required this.catl1,
        required this.catl2,
        required this.catl3,
        required this.silver,
        required this.brands,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        condiciones: json["condiciones"],
        image: json["image"],
        pvp: json["pvp"],
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        catl1: json["catl1"],
        catl2: json["catl2"],
        catl3: json["catl3"],
        silver: json["silver"],
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "condiciones": condiciones,
        "image": image,
        "pvp": pvp,
        "brand_id": brandId,
        "brand_name": brandName,
        "catl1": catl1,
        "catl2": catl2,
        "catl3": catl3,
        "silver": silver,
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    };
}

class Brand {
    int brandId;
    String name;

    Brand({
        required this.brandId,
        required this.name,
    });

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brandId: json["brand_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "brand_id": brandId,
        "name": name,
    };
}

class Redemption {
    String id;
    String redeemId;
    String prizeName;
    String imageUrl;
    int createdAt;
    int updatedAt;
    num points;
    String pointType;
    String state;
    bool isRedemptionExternalCoupon;
    String prizeDescription;
    String code;
    String downloadUrl;

    Redemption({
        required this.id,
        required this.redeemId,
        required this.prizeName,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.points,
        required this.pointType,
        required this.state,
        required this.isRedemptionExternalCoupon,
        required this.prizeDescription,
        required this.code,
        required this.downloadUrl,
    });

    factory Redemption.fromJson(Map<String, dynamic> json) => Redemption(
        id: json["_id"],
        redeemId: json["redeem_id"],
        prizeName: json["prize_name"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        points: json["points"],
        pointType: json["point_type"],
        state: json["state"],
        isRedemptionExternalCoupon: json["is_redemption_external_coupon"],
        prizeDescription: json["prize_description"],
        code: json["code"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "redeem_id": redeemId,
        "prize_name": prizeName,
        "image_url": imageUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "points": points,
        "point_type": pointType,
        "state": state,
        "is_redemption_external_coupon": isRedemptionExternalCoupon,
        "prize_description": prizeDescription,
        "code": code,
        "download_url": downloadUrl,
    };
}
