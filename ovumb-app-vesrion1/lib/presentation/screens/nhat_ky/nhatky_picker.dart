import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

class NhatKyPicker extends StatelessWidget {
  const NhatKyPicker({
    super.key,
    required this.controller1,
    required this.controller2,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 30,
      width: screenSize.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              height: 25,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: Palette.textColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${controller1.text}.${controller2.text}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
