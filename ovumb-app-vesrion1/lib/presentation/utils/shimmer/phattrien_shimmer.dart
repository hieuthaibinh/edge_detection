import 'package:flutter/material.dart';

class PhatTrienShimmer extends StatelessWidget {
  const PhatTrienShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          margin: EdgeInsets.only(right: 25),
          alignment: Alignment.topLeft,
          height: 230,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        /////
        Container(
          height: 50,
          width: size.width,
          padding: EdgeInsets.only(top: 20, bottom: 10, right: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 400,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15, right: 25),
                height: 100,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, right: 25),
                height: 100,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 25, top: 40),
                alignment: Alignment.center,
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
