import 'package:flutter/material.dart';
import '../../../data/models/notifications_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.data, required this.onTap});

  final NotificationsModel data;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          color: Color(0xFFC6C1C1),
          child: ListTile(
            leading: Icon(
              Icons.notifications_outlined,
              color: Colors.red,
              size: 25,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(data.body, style: TextStyle(fontSize: 12)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(data.date, style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
