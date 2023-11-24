import 'package:flutter/material.dart';

class MilkBottleAnimation extends StatefulWidget {
  const MilkBottleAnimation({super.key});

  @override
  State<MilkBottleAnimation> createState() => _MilkBottleAnimationState();
}

class _MilkBottleAnimationState extends State<MilkBottleAnimation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: rose400.withOpacity(0.45),
          //       spreadRadius: 5,
          //       blurRadius: 9,
          //       offset: Offset(9, 9),
          //     ),
          //   ],
          // ),
          padding: EdgeInsets.only(right: 20, left: 20),
          // child: LiquidLinearProgressIndicator(
          //   value: dataBuBinh[0].value,
          //   valueColor: AlwaysStoppedAnimation(Color(0xffe8edff)),
          //   backgroundColor: Colors.white,
          //   borderColor: Colors.white,
          //   borderWidth: 10.0,
          //   direction: Axis.vertical,
          // ),
        ),
        Container(
          width: 200,
          child: Image.asset('assets/images/bottle.png'),
        ),
      ],
    );
  }
}
