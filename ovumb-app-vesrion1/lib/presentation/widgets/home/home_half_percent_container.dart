// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeHalfPercentContainer extends StatelessWidget {
  const HomeHalfPercentContainer({
    Key? key,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.text,
    required this.percent,
    required this.titleText,
    required this.subText,
    required this.subTextColor,
    required this.imageUrl,
    required this.visibleSubText,
    required this.visibleTitleText,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color backgroundColor;
  final String text;
  final double percent;
  final String titleText;
  final String subText;
  final Color subTextColor;
  final String imageUrl;
  final bool visibleSubText;
  final bool visibleTitleText;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: percent == 1
                  ? Image.asset(
                      imageUrl,
                      scale: 3,
                    )
                  : CircularPercentIndicator(
                      radius: 25,
                      lineWidth: 5,
                      animation: true,
                      percent: percent,
                      center: Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: color),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: color,
                      backgroundColor: whiteColor,
                    ),
            ),
            Visibility(
              visible: visibleTitleText,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: visibleTitleText,
                      child: Text(
                        titleText,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ).copyWith(
                          color: color,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Visibility(
                      visible: visibleSubText,
                      child: Text(
                        subText,
                        textScaleFactor: 1,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ).copyWith(
                          color: subTextColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //SubText(text: subText, size: 12, color: subTextColor)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
