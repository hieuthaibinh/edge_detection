import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

Future<void> upgradeVersionAppDialog(
  BuildContext context,
  String link,
) async {
  return showDialog<void>(
    barrierColor: Colors.black45,
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 220,
            width: 200,
            //margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.transparent),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff101828).withAlpha(30),
                  spreadRadius: 0,
                  blurRadius: 24,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        'Cập nhật OvumB',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: grey700,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Phiên bản mới nhất của OvumB đã có trên cửa hàng. Bạn có muốn cập nhật phiên bản mới nhất không?',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  color: grey300,
                ),
                Expanded(
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                              await LaunchUrl.webLink(
                                context: context,
                                link: link,
                              );
                            },
                            child: Center(
                              child: Text(
                                'Cập nhật ngay',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  color: Color(0xff6792FF),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: grey300,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text(
                                'Nhắc tôi sau',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  color: Color(0xff6792FF),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
