enum NotificationEnum {
  payment,
  reciept,
  update,
  discout,
}

class NotificationModel {
  final String title;
  final String detail;
  final bool isNotSeen;
  final String date;
  final NotificationEnum notificationtype;
  NotificationModel({
    required this.title,
    required this.detail,
    required this.isNotSeen,
    required this.date,
    required this.notificationtype,
  });
}

List<NotificationModel> notificationList = [payment, released, update, nikayu];

NotificationModel payment = NotificationModel(
  title: 'Payment Success',
  detail:
      'You success an order payment from Star Store in the amount of \$89.99',
  isNotSeen: true,
  date: 'Today',
  notificationtype: NotificationEnum.payment,
);

NotificationModel released = NotificationModel(
  title: 'Released Receipt',
  detail: 'Congratuliation! Your receipt has been released.',
  isNotSeen: true,
  date: 'Yesterday',
  notificationtype: NotificationEnum.reciept,
);
NotificationModel update = NotificationModel(
  title: 'Update App',
  detail: 'Your application has made updates to improve services',
  isNotSeen: false,
  date: '12/8',
  notificationtype: NotificationEnum.update,
);
NotificationModel nikayu = NotificationModel(
  title: 'Nikayu_Official',
  detail: 'congratulations !! You get a discount of up to 30% for all items.',
  isNotSeen: false,
  date: '10/8',
  notificationtype: NotificationEnum.discout,
);
