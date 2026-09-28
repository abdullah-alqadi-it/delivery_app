import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  // خصائص اختيارية
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double verticalPadding;
  final Widget? icon;
  final double height;
  final double width;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.amber100,
    this.foregroundColor = AppColors.white,
    this.borderColor,
    this.borderRadius = 10.0,
    this.verticalPadding = 8.0,
    this.icon,
    this.height = 52.0,
    this.width = double.infinity,
    this.fontSize = 15.0,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
          padding: EdgeInsets.symmetric(
            // vertical: verticalPadding,
            // horizontal: 8,
          ),
        ),
        //icon ?? const SizedBox.shrink()
        icon: icon,
        label: Text(
          label,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
