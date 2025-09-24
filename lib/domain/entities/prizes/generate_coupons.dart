
class GenerateCoupons {
  final String ok;
  final String id;
  final String type;
  final String description;
  final String name;
  final String points;
  final String tyc;
  final String imageUrl;
  final String pointType;
  final MetadataCouponsGenerate metadata;
  final RedemtionCouponsGenerate redemption;
  final String redeemUrl;
  final String message;

  GenerateCoupons({
    required this.ok,
    required this.id,
    required this.type,
    required this.description,
    required this.name,
    required this.points,
    required this.tyc,
    required this.imageUrl,
    required this.pointType,
    required this.metadata,
    required this.redemption,
    required this.redeemUrl,
    required this.message
  });
}

class MetadataCouponsGenerate{
  final int productId;
  final String name;
  final String description;
  final String tyc;
  final String image;
  final int pvp;
  final String brandId;

  MetadataCouponsGenerate({
    required this.productId,
    required this.name,
    required this.description,
    required this.tyc,
    required this.image,
    required this.pvp,
    required this.brandId,
  });
}

class RedemtionCouponsGenerate{
  final String id;
  final String redeemId;
  final String prizeName;
  final String imageUrl;
  final String downloadUrl;

  RedemtionCouponsGenerate({
    required this.id,
    required this.redeemId,
    required this.prizeName,
    required this.imageUrl,
    required this.downloadUrl
  });
}

