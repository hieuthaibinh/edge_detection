import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';


// ignore: must_be_immutable
class Gioithieu extends StatelessWidget {
  TVV tvv;
  Gioithieu({
    super.key,
    required this.tvv,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              'Giới thiệu',
              style: TextStyle(
                color: grey500,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 150,
            ),
            width: size.width,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 12,
                  offset: Offset(1, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chuyên Gia Hỗ Trợ Sinh Sản',
                    style: TextStyle(
                      color: grey600,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    child: Text(
                      tvv.gioiThieu,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: grey500,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      //maxLines: 4,
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
