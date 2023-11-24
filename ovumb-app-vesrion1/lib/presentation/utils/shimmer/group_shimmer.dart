import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class GroupShimmer extends StatelessWidget {
  const GroupShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 40),
          height: 320,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: grey300,
                  height: 0,
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            height: 60,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 20,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 10,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 10,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey200),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
