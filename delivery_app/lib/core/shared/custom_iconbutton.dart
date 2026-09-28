import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
     this.size,
  });

  final IconData icon;
  final VoidCallback onPressed;
  
  final dynamic size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white18,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.white,),
      ),
    );
  }
}
