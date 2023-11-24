import 'package:flutter/material.dart';

class BabyShimmer extends StatelessWidget {
  const BabyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 65,
          width: 65,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
        ),
        Container(
          height: 65,
          width: 65,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
        ),
        Container(
          height: 65,
          width: 65,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
