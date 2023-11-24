import 'package:flutter/material.dart';

class AvatarShimmer extends StatelessWidget {
  const AvatarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Colors.black,
      ),
    );
  }
}
