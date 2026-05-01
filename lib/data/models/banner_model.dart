class BannerModel {
  final String id;
  final String productImage;
  final String? nameStore;
  final String? imageStore;
  final List<OfferModel> offers;

  BannerModel({
    required this.id,
    required this.productImage,
    this.nameStore,
    this.imageStore,
    required this.offers,
  });
}
class OfferModel {
  final String? subtitle_1;
  final String? subtitle_2;
  final String? discount;

  OfferModel({
    this.subtitle_1,
    this.subtitle_2,
    this.discount
  });
}
