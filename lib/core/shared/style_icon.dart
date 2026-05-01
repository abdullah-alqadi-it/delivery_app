import 'package:flutter/material.dart';

class StyleIcon extends StatelessWidget {
  const StyleIcon({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ), color: Colors.white,
      child: child,
    );
  }
}
