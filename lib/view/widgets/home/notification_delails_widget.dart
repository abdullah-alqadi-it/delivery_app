import 'package:flutter/material.dart';
import '../../../data/models/notifications_model.dart';

class NotificationDetailsWidget extends StatelessWidget {
  const NotificationDetailsWidget({super.key, required this.data});

  final NotificationsModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        Text(
          data.body,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),

        const SizedBox(height: 15),

        Text(data.date, style: TextStyle(fontSize: 12)),

        const SizedBox(height: 100),
      ],
    );
  }
}
