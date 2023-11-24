// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

// Câu hỏi và câu trả lời khi click để dropdown
// ignore: must_be_immutable
class CanhBaoChamDropdown extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  bool isShow;
  int currentIndex;
  CanhBaoChamDropdown({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.isShow,
    required this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  width: size.width,
                  //color: Colors.transparent,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 7,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentIndex == 0) ...[
                          Image.asset(
                            'assets/icons/phase5_baodong.png',
                            scale: 5,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4),
                        ],
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: grey700,
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
              ],
            ),
            Container(
              constraints: const BoxConstraints(
                minHeight: 50,
              ),
              width: size.width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(image),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          subTitle,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: grey700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}