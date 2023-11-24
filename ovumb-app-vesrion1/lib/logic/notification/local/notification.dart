import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('mipmap/ic_logo');
    var IOSInitialize = const IOSInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: IOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onSelectNotification: (payload) async {
        if (payload != null) {
          await launchWebUrl(payload);
        }
      },
    );
  }

  //thông báo hàng ngày
  static Future showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
    //tz.TZDateTime? scheduledTime,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'ovumb',
      'channel_name',
      'channel_name',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const IOSNotificationDetails());
    await fln.zonedSchedule(
      0,
      title,
      body,
      nextInstanceOfTenAm(),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  // thông báo sau khi test
  static Future showLHNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
    //tz.TZDateTime? scheduledTime,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'ovumb',
      'channel_name',
      'channel_name',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const IOSNotificationDetails());

    tz.initializeTimeZones();
    final location = tz.getLocation('Asia/Ho_Chi_Minh');
    final now = tz.TZDateTime.now(location);
    var schedule = now.add(Duration(hours: 4));
    for (int i = 0; i < 3; i++) {
      await fln.zonedSchedule(
        i + 1,
        title,
        body,
        schedule,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload,
      );
      schedule = schedule.add(Duration(hours: 4));
    }
  }
}

// thông báo 9 hàng ngày
tz.TZDateTime nextInstanceOfTenAm() {
  tz.initializeTimeZones();
  final location = tz.getLocation('Asia/Ho_Chi_Minh');
  final now = tz.TZDateTime.now(location);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(location, now.year, now.month, now.day, 9);
  return scheduledDate;
}

tz.TZDateTime nextInstanceTest() {
  tz.initializeTimeZones();
  final location = tz.getLocation('Asia/Ho_Chi_Minh');
  final now = tz.TZDateTime.now(location);
  tz.TZDateTime scheduledDate = tz.TZDateTime(location, now.year, now.month,
      now.day, now.hour, now.minute, now.second + 10);
  return scheduledDate;
}
