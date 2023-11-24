// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utils/color.dart';

// Phần container box chiếm nửa chiều ngang màn hình
class HomeHalfContainer extends StatelessWidget {
  const HomeHalfContainer({
    Key? key,
    required this.gradientFrom,
    required this.gradientTo,
    required this.title,
    this.sub,
    required this.image,
    required this.beginGradient,
    required this.endGradient,
  }) : super(key: key);

  final Color gradientFrom;
  final Color gradientTo;
  final String title;
  final String? sub;
  final String image;
  final Alignment beginGradient;
  final Alignment endGradient;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: beginGradient,
                end: endGradient,
                colors: [
                  gradientFrom,
                  gradientTo,
                ],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: size.width,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 3,
                    ),
                  ),
                  if (sub != null) ...[
                    Text(
                      sub!,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ],
              ),
            ),
          ),
          Positioned(
            height: 70,
            right: -6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                image,
                scale: 3.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
