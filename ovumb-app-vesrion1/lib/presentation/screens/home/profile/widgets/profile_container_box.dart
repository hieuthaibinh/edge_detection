// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../widgets/title_text.dart';

class ProfileBoxContainer extends StatelessWidget {
  final String leftIcon;
  final String title;
  const ProfileBoxContainer({
    Key? key,
    required this.leftIcon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: FractionallySizedBox(
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: grey300,
                width: 1,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset(
                          leftIcon,
                          scale: 3,
                        ),
                      ),
                      TitleText(
                        text: title,
                        fontWeight: FontWeight.w600,
                        size: 16,
                        color: grey700,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/icons/next_button.png',
                    alignment: Alignment.centerRight,
                    scale: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
