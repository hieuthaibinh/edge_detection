// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';

import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Lienhe extends StatelessWidget {
  final TVV tvv;
  const Lienhe({
    Key? key,
    required this.tvv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _callNumber(String phone) async {
      await FlutterPhoneDirectCaller.callNumber(phone);
    }

    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      height: 150,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
            ),
            child: Text(
              'Liên hệ',
              style: TextStyle(
                color: grey500,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 80,
            width: size.width,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    LaunchUrl.webLink(context: context, link: tvv.linkZalo);
                  },
                  child: Image.asset('assets/images/zalo.png', scale: 3),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    LaunchUrl.webLink(context: context, link: tvv.linkFb);
                  },
                  child: Image.asset('assets/images/fb.png', scale: 3),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    _callNumber(tvv.soDienThoai);
                  },
                  child: Image.asset('assets/images/sdt.png', scale: 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
