import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

class NhatKyCheckBox extends StatelessWidget {
  final List<String> items;
  const NhatKyCheckBox({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 30,
      width: screenSize.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
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
                items[i],
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
