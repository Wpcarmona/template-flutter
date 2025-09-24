import 'dart:convert';

GetDataCouponResponse getDataCouponResponseFromJson(String str) => GetDataCouponResponse.fromJson(json.decode(str));

String getDataCouponResponseToJson(GetDataCouponResponse data) => json.encode(data.toJson());

class GetDataCouponResponse {
    String ok;
    DataGetDataCoupons data;

    GetDataCouponResponse({
        required this.ok,
        required this.data,
    });

    factory GetDataCouponResponse.fromJson(Map<String, dynamic> json) => GetDataCouponResponse(
        ok: json["ok"],
        data: DataGetDataCoupons.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class DataGetDataCoupons {
    List<BrandGetDataCuopons> brands;

    DataGetDataCoupons({
        required this.brands,
    });

    factory DataGetDataCoupons.fromJson(Map<String, dynamic> json) => DataGetDataCoupons(
        brands: List<BrandGetDataCuopons>.from(json["brands"].map((x) => BrandGetDataCuopons.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    };
}

class BrandGetDataCuopons {
    int brandId;
    String name;

    BrandGetDataCuopons({
        required this.brandId,
        required this.name,
    });

    factory BrandGetDataCuopons.fromJson(Map<String, dynamic> json) => BrandGetDataCuopons(
        brandId: json["brand_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "brand_id": brandId,
        "name": name,
    };
}
