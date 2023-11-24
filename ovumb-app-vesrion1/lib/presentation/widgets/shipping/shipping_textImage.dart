import 'package:flutter/material.dart';

class ShippingTextImage extends StatelessWidget {
  final String image;
  final String number;
  final String text;
  final Color color;
  ShippingTextImage({
    super.key,
    required this.image,
    required this.number,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: 3,
        ),
        SizedBox(width: 10),
        Text(
          number + ' ' + text,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
