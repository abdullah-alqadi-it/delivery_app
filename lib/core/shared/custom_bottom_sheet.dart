import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.content, this.height});

  final Widget content;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),

      child: Column(
        mainAxisSize: height==null? MainAxisSize.min:MainAxisSize.max,
        children: [
          const SizedBox(height: 20),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.red400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          height != null? Expanded(child: content):content,
        ],
      ),
    );
  }
}
