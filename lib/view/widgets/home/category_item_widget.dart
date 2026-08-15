import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          // تغيير الخلفية بناءً على التحديد
          color: isSelected ? AppColors.gray50 : AppColors.gray200,
          borderRadius: BorderRadius.circular(12),
        ),

        child: SizedBox(
          width: 50,
          height: 50,
          child: CachedNetworkImage(
            imageUrl: isSelected
                ? category.iconActiveUrl
                : category.iconInactiveUrl,
            fit: BoxFit.contain,

            placeholder: (context, url) => const SizedBox.shrink(),

            errorWidget: (context, url, error) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
