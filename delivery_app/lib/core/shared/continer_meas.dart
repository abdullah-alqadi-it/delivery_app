import 'package:delivery_app/core/constant/app_colors.dart';
//import 'package:delivery_app/core/shared/custom_iconbutton.dart';

import 'package:flutter/material.dart';

class ContinerMeasl extends StatelessWidget {
  const ContinerMeasl({super.key, required this.name_meals, this.child});

  final String name_meals;

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 20,

            child: ClipOval(child: child),
          ),
          SizedBox(width: 10),
          Text(
            name_meals,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.black),
          ),
        ],
      ),
      width: 140,
      height: 45,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: AppColors.gray300, blurRadius: 2)],
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
