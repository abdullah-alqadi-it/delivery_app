import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CardSetting extends StatelessWidget {
  const CardSetting({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 3,
        color: AppColors.white,
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 5,right: 12),
          leading: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFEFD5DB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(imagePath,width: 24,height: 24,color: AppColors.red400,),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.black,
            size: 18,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
