import 'package:delivery_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContinerSliverappber extends StatelessWidget {
  final double? size_height;
  final double? size_wight;
  final String? label;
  final Widget? widget;
  final Color? color_CircleAv;
  final Color? color_contine;
  final BoxDecoration? decoration;
  final TextStyle? style;
  final List<BoxShadow>? shadow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  const ContinerSliverappber({
    super.key,
    this.size_height,

    this.widget,
    this.color_CircleAv,
    this.decoration,
    this.color_contine,
    this.size_wight,
    this.label,
    this.style,
    this.shadow,
    this.padding,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: size_wight,

      height: size_height,

      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: color_CircleAv,
              radius: 15,
              child: widget,
            ),
          ),
          SizedBox(width: 10),
          Text(label!, style: style),
          SizedBox(width: 10),
        ],
      ),

      decoration: BoxDecoration(
        borderRadius: borderRadius,

        color: color_contine,
        boxShadow: shadow,
      ),
    );
  }
}
