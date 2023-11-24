import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

//link sang web
launchWebUrl(String url) {
  return launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}

launchAppUrl(String url) {
  return launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
}

class LaunchUrl {
  static final ServerRepository _serverRepository = ServerRepository();
  static final LaunchUrl _singleton = LaunchUrl._internal();
  factory LaunchUrl() {
    return _singleton;
  }

  LaunchUrl._internal();

  // link web
  static Future<void> web({
    required int maLink,
    required String tenLink,
    required BuildContext context,
  }) async {
    LoadingDialog().show(context: context, text: 'Đang điều hướng...');
    String? link = await _serverRepository.getLink(maLink: maLink);
    if (link == null) {
      launchWebUrl(tenLink);
    } else {
      launchWebUrl(link);
      ServerRepository().insertClick(maLink: maLink);
    }
    LoadingDialog().hide();
  }

  static Future<void> webLink({
    required String link,
    required BuildContext context,
  }) async {
    LoadingDialog().show(context: context, text: 'Đang điều hướng...');
    launchWebUrl(link);
    LoadingDialog().hide();
  }

  static Future<void> inApp({
    required String tenLink,
    required BuildContext context,ct
  }) async {
    LoadingDialog().show(context: context, text: 'Đang điều hướng...');
    launchAppUrl(tenLink);
    LoadingDialog().hide();
  }
}
