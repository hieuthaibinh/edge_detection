// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/model_tiemchung.dart';

// Phần container box chiếm cả chiều ngang màn hình
class HomeFullContainer extends StatelessWidget {
  final String title;
  final String sub;
  final String image;
  final Color fromColor;
  final Color toColor;
  final Color textColor;
  final Alignment directFrom;
  final Alignment directTo;
  final BoxShadow? shadow;
  const HomeFullContainer({
    Key? key,
    required this.title,
    required this.sub,
    required this.image,
    required this.fromColor,
    required this.toColor,
    required this.textColor,
    required this.directFrom,
    required this.directTo,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Stack(
        children: [
          Container(
            height: textTiemChung[0].isClick ? 0 : 70,
            width: textTiemChung[0].isClick ? 0 : size.width,
            decoration: BoxDecoration(
              boxShadow: shadow != null ? [shadow!] : null,
              gradient: LinearGradient(
                begin: directFrom,
                end: directTo,
                colors: [
                  fromColor,
                  toColor,
                ],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    scale: 3.3,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(sub,
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: textColor,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
