// gửi thông báo
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ovumb_app_version1/logic/notification/local/data_notification.dart';
import 'package:flutter_ovumb_app_version1/logic/notification/local/notification.dart';

void sendNotification(
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  DataNotification dataNotification, {
  String? payload,
}) async {
  Noti.initialize(flutterLocalNotificationsPlugin);
  await Noti.showBigTextNotification(
    title: dataNotification.title,
    body: dataNotification.describe,
    fln: flutterLocalNotificationsPlugin,
    payload: payload,
  );
}


void sendLHNotification(
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  DataNotification dataNotification, {
  String? payload,
}) async {
  Noti.initialize(flutterLocalNotificationsPlugin);
  await Noti.showLHNotification(
    title: dataNotification.title,
    body: dataNotification.describe,
    fln: flutterLocalNotificationsPlugin,
    payload: payload,
  );
}
