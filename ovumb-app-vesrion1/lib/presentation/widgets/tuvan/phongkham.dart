import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class Phongkham extends StatelessWidget {
  const Phongkham({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      height: 220,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
            ),
            child: Text(
              'Phòng khám',
              style: TextStyle(
                color: grey500,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 150,
            width: size.width,
            margin: EdgeInsets.only(
              top: 15,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/info.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
