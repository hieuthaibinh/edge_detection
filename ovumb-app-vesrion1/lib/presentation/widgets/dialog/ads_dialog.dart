// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';

// hiển thị hướng dẫn trong phần lịch
Future<void> adsDialog(
  BuildContext context,
  String imageUrl,
  String link,
) {
  return showDialog<void>(
    //barrierColor: Colo,
    context: context,
    builder: (BuildContext context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: AlertDialog(
          elevation: 0,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          content: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 650,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.transparent),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff10182814),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    launchWebUrl(link);
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/icons/exit_dialog.png',
                    scale: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
