import 'package:flutter/material.dart';

class TestShimmer extends StatelessWidget {
  const TestShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: screenSize.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 20,
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 14,
            child: Container(
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 20,
                  width: screenSize.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                Container(
                  height: 20,
                  width: screenSize.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(38),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {},
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        )),
                        elevation: MaterialStateProperty.all(0),
                        fixedSize: MaterialStateProperty.all(
                          Size(
                            screenSize.width,
                            screenSize.height * 0.065,
                          ),
                        ),
                        //foregroundColor: MaterialStateProperty.all(roseTitleText),
                      ),
                      child: const Text(''),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 20,
                    width: screenSize.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}