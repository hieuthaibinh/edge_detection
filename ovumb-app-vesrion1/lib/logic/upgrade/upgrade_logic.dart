import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/handle/datetime_handle.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/logic/upgrade/upgrade_api.dart';
import 'package:flutter_ovumb_app_version1/logic/upgrade/upgrade_version.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/upgrade/upgrade_dialog.dart';

class UpgraderLogic {
  UpgradeApi _upgradeApi = UpgradeApi();
  DateTimeHandle _dateTimeHandle = DateTimeHandle();

  Future<void> checkVersion({
    required BuildContext context,
    required int dayNextRequest,
  }) async {
    int now = _dateTimeHandle.dateStartFormat(DateTime.now());
    int next = _dateTimeHandle
        .dateStartFormat(DateTime.now().add(Duration(days: dayNextRequest)));
    //kiểm tra xem ngày hôm nay đã call api chưa
    int? localAPItime = await SharedPreferencesService.getCallVersion();
    if (localAPItime != null) {
      if (localAPItime < now) {
        int? lastest = await _upgradeApi.getLastestVersion();
        if (lastest != null) {
          if (OVUMB_CURRENT_VERSION < lastest) {
            SharedPreferencesService.setCallVersion(next);
            upgradeVersionAppDialog(context, checkPlatform());
          }
          SharedPreferencesService.setCallVersion(now); 
        }
      }
    } else {
      int? lastest = await _upgradeApi.getLastestVersion();
      if (lastest != null) {
        if (OVUMB_CURRENT_VERSION < lastest) {
          SharedPreferencesService.setCallVersion(next);
          upgradeVersionAppDialog(context, checkPlatform());
        }
        SharedPreferencesService.setCallVersion(now);
      }
    }
  }

  String checkPlatform() {
    if (Platform.isIOS) {
      return OVUMB_IOS_LINK;
    } else if (Platform.isAndroid) {
      return OVUMB_ANDROID_LINK;
    }
    return OVUMB_LINK;
  }
}
