import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String? leadingIcon;

  const CustomRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.red400.withValues(alpha: 0.1) : AppColors.gray100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.red400 : AppColors.gray400,
          // width: 1.5,
        ),
      ),
      child: RadioListTile<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: AppColors.red400,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        controlAffinity: ListTileControlAffinity.trailing,
        secondary: leadingIcon != null?ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: Image.asset('$leadingIcon',height: 50,width: 50,fit: BoxFit.cover),
        ):null,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
