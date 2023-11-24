import 'package:onesignal_flutter/onesignal_flutter.dart';

const oneSignalAppId = 'cd998b1b-86c2-49cb-9e5e-32e5c62067bd';

Future<void> initOneSignal() async {
  final onSignalShared = OneSignal.shared;

  onSignalShared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  onSignalShared.setRequiresUserPrivacyConsent(true);

  await onSignalShared.setAppId(oneSignalAppId);
}

registerOneSignalEventListener({
  required Function(OSNotificationOpenedResult) onOpened,
  required Function(OSNotificationReceivedEvent) onReceivedForeground,
}) {
  final oneSignalShared = OneSignal.shared;

  oneSignalShared.setNotificationOpenedHandler(onOpened);

  oneSignalShared
      .setNotificationWillShowInForegroundHandler(onReceivedForeground);
}

const tagName = 'userId';

sendUserTag(int userId) {
  OneSignal.shared.sendTag(tagName, userId).then((value) {
    //print(value);
  }).catchError((error) {
    //print(error);
  });
}

deleteUserTag(int userId) {
  OneSignal.shared.sendTag(tagName, userId).then((value) {
    //print(value);
  }).catchError((error) {
    //print(error);
  });
}
