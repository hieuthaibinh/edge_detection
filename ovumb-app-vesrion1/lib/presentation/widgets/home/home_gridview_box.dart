// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

// Phần grid view
class HomeGridviewBox extends StatelessWidget {
  final String text1;
  final String? text2;
  final String imageUrl;
  final Color fromColor;
  final Color toColor;
  final bool isSelected;
  const HomeGridviewBox({
    Key? key,
    required this.text1,
    this.text2,
    required this.imageUrl,
    required this.fromColor,
    required this.toColor,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  fromColor,
                  toColor,
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                        ),
                      ),
                      if (text2 != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          text2!,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Expanded(
                  //flex: 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      imageUrl,
                      scale: 3,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
