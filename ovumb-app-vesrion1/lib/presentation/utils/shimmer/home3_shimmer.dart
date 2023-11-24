import 'package:flutter/material.dart';

class Home3Shimmer extends StatelessWidget {
  const Home3Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 92,
            width: size.width,
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(width: size.width * 0.03),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 25,
                        width: size.width * 0.51,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        //color: Colors.blue,
                        height: 62,
                        width: size.width * 0.58,
                        child: Row(
                          children: List.generate(
                            3,
                            (index) => Container(
                              margin: EdgeInsets.only(
                                right: 5,
                                top: 5,
                                bottom: 5,
                              ),
                              width: size.width * 0.17,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.014),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            height: 160,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            height: 250,
            width: size.width,
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ],
      ),
    );
  }
}
