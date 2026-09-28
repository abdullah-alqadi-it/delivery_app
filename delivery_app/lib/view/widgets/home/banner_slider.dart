import 'package:flutter/material.dart';
import '../../../data/models/banner_model.dart';
import 'banner_card_item.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key, required this.banners});

  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        itemBuilder: (context, index) => BannerCardItem(banner: banners[index]),
      ),
    );
  }
}
