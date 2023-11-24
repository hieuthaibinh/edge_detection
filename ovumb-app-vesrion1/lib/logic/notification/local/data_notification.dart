//  {}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/logic/notification/local/push_notification.dart';
import '../../../data/models/calendar/ckkn_display.dart';

class DataNotification {
  final id;
  final title;
  final describe;

  DataNotification(this.id, this.title, this.describe);
}

List<DataNotification> dataNotification = [
  DataNotification(
    0,
    '2 ngày nữa là đến thời kỳ Cửa sổ thụ thai',
    'Hãy chuẩn bị que test bạn nhé!',
  ),
  DataNotification(
    1,
    'Chỉ còn 1 ngày nữa là đến thời kỳ Cửa sổ thụ thai',
    'Hãy chuẩn bị que test bạn nhé!',
  ),
  DataNotification(
    2,
    'Ngày đầu tiên của thời kỳ Cửa sổ thụ thai',
    'Hãy test que rụng trứng vào lúc 10h sáng bạn nhé!',
  ),
  DataNotification(
    3,
    'Bạn đã có kinh chưa?',
    'Hãy lưu lại ngày kinh và lượng kinh nguyệt của bạn nhé!',
  ),
  DataNotification(
    4,
    'Bạn đã có kinh chưa?',
    'Hãy nhớ lưu lại ngày kinh nếu bạn vẫn đang trong chu kỳ kinh nguyệt nhé!',
  ),
  DataNotification(
    5,
    'OvumB xin chào bạn',
    'Hãy vào app để kiểm tra lịch ngày hôm nay của mình nhé!',
  ),
];

void checkNotification(
  List<KinhNguyet> listKinhNguyet,
  CKKNDisplay ckknDisplay,
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
) {
  DateTime now = DateTime.now();
  if (now.hour >= 9) {
    if (ckknDisplay.sntcl == 3) {
      sendNotification(flutterLocalNotificationsPlugin, dataNotification[0]);
    } else if (ckknDisplay.sntcl == 2) {
      sendNotification(flutterLocalNotificationsPlugin, dataNotification[1]);
    } else if (ckknDisplay.sntcl == 1) {
      sendNotification(flutterLocalNotificationsPlugin, dataNotification[2]);
    } else {
      for (KinhNguyet kn in listKinhNguyet) {
        if (checkBetween(now, kn.ngayBatDauKinh!, kn.ngayKetThucKinh!)) {
          sendNotification(
              flutterLocalNotificationsPlugin, dataNotification[3]);
        } else if (checkBetween(
            now, kn.ngayBatDauTrung!, kn.ngayKetThucTrung!)) {
          if (kn.ngayKetThucTrung!.difference(now).inDays < 1) {
            sendNotification(
                flutterLocalNotificationsPlugin, dataNotification[5]);
          } else {
            int i = now.difference(kn.ngayBatDauTrung!).inDays + 1;
            sendNotification(
              flutterLocalNotificationsPlugin,
              DataNotification(
                '0',
                'Ngày thứ $i của thời kỳ Cửa sổ thụ thai',
                'Hãy test que rụng trứng vào lúc 10h sáng bạn nhé!',
              ),
            );
          }
        } else if (checkBetween(now, kn.ngayBatDau!, kn.ngayKetThuc!)) {
          sendNotification(
              flutterLocalNotificationsPlugin, dataNotification[5]);
        }
      }
    }
  } else {
    if (ckknDisplay.sntcl == 2) {
      sendNotification(flutterLocalNotificationsPlugin, dataNotification[0]);
    } else if (ckknDisplay.sntcl == 1) {
      sendNotification(flutterLocalNotificationsPlugin, dataNotification[1]);
    } else {
      for (KinhNguyet kn in listKinhNguyet) {
        if (checkBetween(now, kn.ngayBatDauKinh!, kn.ngayKetThucKinh!)) {
          sendNotification(
              flutterLocalNotificationsPlugin, dataNotification[3]);
        } else if (checkBetween(
            now, kn.ngayBatDauTrung!, kn.ngayKetThucTrung!)) {
          if (kn.ngayKetThucTrung!.difference(now).inDays < 0) {
            sendNotification(
                flutterLocalNotificationsPlugin, dataNotification[5]);
          } else {  
            int i = now.difference(kn.ngayBatDauTrung!).inDays + 1;
            sendNotification(
              flutterLocalNotificationsPlugin,
              DataNotification(
                '0',
                'Ngày thứ $i của thời kỳ Cửa sổ thụ thai',
                'Hãy test que rụng trứng vào lúc 10h sáng bạn nhé!',
              ),
            );
          }
        } else if (checkBetween(now, kn.ngayBatDau!, kn.ngayKetThuc!)) {
          sendNotification(
              flutterLocalNotificationsPlugin, dataNotification[5]);
        }
      }
    }
  }
}

void checkLHNotification(
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  String title,
  String subTitle,
) {
  sendLHNotification(
    flutterLocalNotificationsPlugin,
    DataNotification('0', title, subTitle),
  );
}
