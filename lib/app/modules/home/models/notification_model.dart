import 'dart:convert';

import 'user_model.dart';

class NotificationModel {
  String notificationFrom;
  DateTime notificationDateTime;
  String notificationMessage;
  String notificationId;
  NotificationType notificationType;
  NotificationModel(
      {required this.notificationFrom,
      required this.notificationDateTime,
      required this.notificationMessage,
      required this.notificationId,
      required this.notificationType});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'notificationFrom': notificationFrom});
    result.addAll(
        {'notificationDateTime': notificationDateTime.millisecondsSinceEpoch});
    result.addAll({'notificationMessage': notificationMessage});
    result.addAll({'notificationId': notificationId});
    result.addAll({'notificationType': notificationType.toMap()});
    return result;
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      notificationFrom: map['notificationFrom'] ?? '',
      notificationDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['notificationDateTime']),
      notificationMessage: map['notificationMessage'] ?? '',
      notificationId: map['notificationId'] ?? '',
      notificationType: NotificationType.fromMap(map['notificationType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));
}

class NotificationType {
  String notificationType;
  String typeId;
  NotificationType({
    required this.notificationType,
    required this.typeId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'notificationType': notificationType});
    result.addAll({'typeId': typeId});

    return result;
  }

  factory NotificationType.fromMap(Map<String, dynamic> map) {
    return NotificationType(
      notificationType: map['notificationType'] ?? '',
      typeId: map['typeId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationType.fromJson(String source) =>
      NotificationType.fromMap(json.decode(source));
}

class NotificationTypes {
  static String release = 'New Product';
  static String payment = 'Payment Success';
  static String update = 'Update App';
  List<String> get allNotificationTypes => [release, payment, update];
}

class NotificationDetailsModel {
  NotificationModel notification;
  UserModel user;
  NotificationDetailsModel({
    required this.notification,
    required this.user,
  });
}
