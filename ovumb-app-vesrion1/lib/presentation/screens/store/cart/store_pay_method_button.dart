// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class StorePayMethodButton extends StatelessWidget {
  final bool isSelected;
  final String image;
  const StorePayMethodButton({
    Key? key,
    required this.isSelected,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? violet300 : grey300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? violet200 : grey200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            image,
            scale: 3,
            color: isSelected ? violet500 : grey400,
          ),
        ),
      ),
    );
  }
}
