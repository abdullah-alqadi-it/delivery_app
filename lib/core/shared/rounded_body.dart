import 'package:flutter/material.dart';

class RoundedBody extends StatelessWidget {
  const RoundedBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor, // اللون الخلفي
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: child,
    );
  }
}