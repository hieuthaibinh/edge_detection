// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// Phần container box chiếm cả chiều ngang màn hình
class HomeFullContainer1 extends StatelessWidget {
  final String title;
  final String sub;
  final String image;
  final Color fromColor;
  final Color toColor;
  final Color textColor;
  final Alignment directFrom;
  final Alignment directTo;
  const HomeFullContainer1({
    Key? key,
    required this.title,
    required this.sub,
    required this.image,
    required this.fromColor,
    required this.toColor,
    required this.directFrom,
    required this.directTo,
    required this.textColor,
  }) : super(key: key);

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
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 12,
                  offset: Offset(1, 5),
                ),
              ],
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
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
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
                        Text(
                          sub,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: textColor,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    image,
                    scale: 3,
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
