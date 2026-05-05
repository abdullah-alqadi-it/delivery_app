import 'package:flutter/material.dart';

class CardSetting extends StatelessWidget {
  const CardSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 3,
        color: const Color(0xFFFFFEFE),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color(0xFFEFD5DB),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: Color(0xFFA50426)),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 16,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
