import 'package:flutter/material.dart';
import '../../../core/shared/custom_bottom_sheet.dart';
import '../../../core/shared/rounded_body.dart';
import '../../../data/models/notifications_model.dart';
import '../../widgets/home/notification_card.dart';
import '../../widgets/home/notification_delails_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key, required this.notification});

  final List<NotificationsModel> notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB1E49),
      appBar: AppBar(
        backgroundColor: Color(0xFFEB1E49),
        centerTitle: true,
        title: Text('الاشعارات', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 26, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined, size: 26, color: Colors.white),
          ),
        ],
        toolbarHeight: 65,
      ),

      body: RoundedBody(
        borderRadius: 20,
        child: ListView.builder(
          itemCount: notification.length,
          itemBuilder: (context, index) => NotificationCard(
            data: notification[index],
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => CustomBottomSheet(
                  content: NotificationDetailsWidget(data: notification[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
