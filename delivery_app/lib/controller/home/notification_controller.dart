import '../../data/models/notifications_model.dart';

class NotificationController {
  List<NotificationsModel> notifications = [
    NotificationsModel(
      title: "عرض يستحق التجربة 😍",
      body:
          "باكجات مميزة من تراك برجر & الأرض الخضراء وخصومات حتى 25% اطلب الان",
      date: "2026-04-30 12:34:44",
    ),
    NotificationsModel(
      title: "هدية مجانية مع كل طلب 🎁",
      body: "احتفالاً بمرور 10 سنوات على افتتاح مطعم شوايتي اطلب الآن!",
      date: "2026-05-01 10:00:00",
    ),
    NotificationsModel(
      title: "جمعتكم أحلى مع توصيل ون 😍",
      body: 'اطلب كل اللي تحتاجه يوصل لعندك',
      date: "2026-05-01 10:00:00",
    ),
  ];
}
