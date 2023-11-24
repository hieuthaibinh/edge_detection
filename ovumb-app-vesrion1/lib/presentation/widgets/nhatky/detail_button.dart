import 'package:flutter/material.dart';
import 'dart:math' as math;

class DetailsButton extends StatefulWidget {
  const DetailsButton({super.key});

  @override
  State<DetailsButton> createState() => _DetailsButtonState();
}

class _DetailsButtonState extends State<DetailsButton> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi, // = quay 180*
      child: Container(
        padding: const EdgeInsets.only(right: 27),
        child: Image.asset(
          'assets/icons/back_button.png',
          scale: 3,
        ), //neu true co gt thi moi chuyen thanh mui ten
      ),
    );
  }
}
