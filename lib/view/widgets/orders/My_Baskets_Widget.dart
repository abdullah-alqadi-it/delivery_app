import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class MyBasketsWidget extends StatelessWidget {
  const MyBasketsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.red400,
              borderRadius: const BorderRadius.all(Radius.circular(10),),
            ),
            child: const Text(
              'سلات المتاجر التي لم يتم إتمام طلبها',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                'لا يوجد سلة',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
