// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PhattrienArrow extends StatelessWidget {
  final Color color;
  final int type;
  final int index;
  final BorderRadiusGeometry? borderRadius;
  const PhattrienArrow({
    Key? key,
    required this.color,
    required this.type,
    required this.index,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _checkFocus(int type, int index) {
      return type == index ? true : false;
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Expanded(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 2),
              height: 10,
              decoration: BoxDecoration(color: color, borderRadius: borderRadius),
            ),
            SizedBox(height: 8),
            _checkFocus(type, index)
                ? Container(
                    height: 8,
                    child: Image.asset('assets/images/vector.png'),
                  )
                : const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
