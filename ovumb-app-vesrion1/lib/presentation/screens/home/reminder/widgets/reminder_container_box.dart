// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../widgets/sub_text.dart';
import '../../../../widgets/title_text.dart';

//1 cái item thông báo
class ReminderContainerBox extends StatelessWidget {
  final String leftIcon;
  final String title;
  final String subTitle;
  const ReminderContainerBox({
    Key? key,
    required this.leftIcon,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: 70,
          width: size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 7,
                offset: const Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(leftIcon),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(
                            text: title,
                            fontWeight: FontWeight.w600,
                            size: 14,
                            color: grey700,
                          ),
                          SubText(
                            text: subTitle,
                            size: 12,
                            color: grey700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
