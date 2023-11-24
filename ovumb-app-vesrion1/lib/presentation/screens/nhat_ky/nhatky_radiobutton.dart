import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

class NhatKyRadioButton extends StatelessWidget {
  final String item;
  const NhatKyRadioButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 30,
      width: screenSize.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, i) {
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
                item,
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
