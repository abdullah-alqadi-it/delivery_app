import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

/// بيانات تبويب واحد: النص + أيقونة اختيارية
class CustomTabItem {
  final String label;
  final IconData? icon;

  const CustomTabItem({required this.label, this.icon});
}

/// ===================================================
class CustomTabBar extends StatelessWidget {

  final List<CustomTabItem> tabs;

   // كونترولر خارجي — اختياري، يُستخدم مع TabBarView
  final TabController? controller;

  //  لون خلفية التاب المحدد
  final Color selectedColor;

  /// لون خلفية حاوية الـ TabBar كلها
  final Color backgroundColor;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final Color? borderColor;

  // ── أبعاد ───────────────────────────────────────────
  final double height;
  final double borderRadius;
  final EdgeInsets margin;
  final double labelFontSize;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.selectedColor = AppColors.amber100,
    this.backgroundColor = AppColors.white,
    this.selectedLabelColor = AppColors.white,
    this.unselectedLabelColor = AppColors.black,
    this.borderColor,
    this.height = 40,
    this.borderRadius = 30,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    this.labelFontSize = 13,
  });

  // يمكن استدعاؤه من أي مكان:  CustomTabBar.tabContent(...)
  // ────────────────────────────────────────────────────
  static Widget tabContent(
    String label, {
    IconData? icon,
    double iconSize = 18,
  }) {
    if (icon == null) {
      return Text(label);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1.3)
            : null,
      ),
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.zero,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(
          fontSize: labelFontSize,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: labelFontSize,
          fontWeight: FontWeight.w500,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: selectedColor,
        ),
        labelColor: selectedLabelColor,
        unselectedLabelColor: unselectedLabelColor,
        tabs: tabs
            .map((item) => Tab(child: tabContent(item.label, icon: item.icon)))
            .toList(),
      ),
    );
  }
}
