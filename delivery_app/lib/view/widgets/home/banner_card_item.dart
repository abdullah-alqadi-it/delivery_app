import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/banner_model.dart';

class BannerCardItem extends StatelessWidget {
  const BannerCardItem({super.key, required this.banner});

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 272,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(banner.productImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(2),
              onPressed: () {},
              icon: Icon(Icons.zoom_in, color: AppColors.white, size: 25),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 68,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 1,
                  bottom: 1,
                  left: 2,
                  right: 2,
                ),

                color: AppColors.red400,
                child: Text(
                  '${banner.nameStore}',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(banner.imageStore!),
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: Column(
            children: [
              ...banner.offers.map((offer) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DiscountTag(
                    percentage: "${offer.discount}%",
                    subtitle_1: '${offer.subtitle_1}',
                    subtitle_2: '${offer.subtitle_2}',
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

//------------==================-----------------------------

class DiscountTag extends StatelessWidget {
  const DiscountTag({
    super.key,
    required this.percentage,
    required this.subtitle_1,
    required this.subtitle_2,
  });

  final String percentage; // النسبة المئوية للخصم
  final String subtitle_1;
  final String subtitle_2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: -0.1, // زاوية الميل (يمكن تعديلها)
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.red400,
            ),
            alignment: Alignment.center,
            child: Text(
              percentage, // عرض النسبة (مثلاً 30%)
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 2,
                left: 2,
                right: 10,
              ),
              color: Colors.blueAccent,
              child: Text(
                subtitle_1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 2,
                left: 2,
                right: 10,
              ),
              color: AppColors.amber100,
              child: Text(
                subtitle_2,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
