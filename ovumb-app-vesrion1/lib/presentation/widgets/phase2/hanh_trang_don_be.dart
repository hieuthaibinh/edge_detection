import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/data/model_test.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

// ignore: must_be_immutable
class HanhTrangDonBe extends StatefulWidget {
  int widgetId;
  HanhTrangDonBe({required this.widgetId, super.key});

  @override
  State<HanhTrangDonBe> createState() => _HanhTrangDonBeState();
}

class _HanhTrangDonBeState extends State<HanhTrangDonBe> {
  late bool isShow1;
  late bool isShow2;
  late int counter;

  @override
  void initState() {
    isShow1 = false;
    isShow2 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 300,
      padding: EdgeInsets.only(left: 20),
      color: Colors.transparent,
      child: Container(
        width: sizeWidth,
        height: sizeHeight * 0.38,
        color: Colors.transparent,
        child: ListView(
          key: PageStorageKey<String>('page'),
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              //margin: EdgeInsets.only(top: 25),
              height: sizeHeight * 0.04,
              width: sizeWidth,
              //color: Colors.green,
              child: Text(
                dataMeVaBe2[0].title,
                style: TextStyle(
                    color: Palette.text,
                    fontSize: 19,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: sizeHeight * 0.45,
              width: sizeWidth,
              //color: Colors.blue,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 24, top: 15),
                    padding: EdgeInsets.only(bottom: 5),
                    width: sizeWidth * 0.385,
                    decoration: BoxDecoration(
                      //color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 16,
                                offset:
                                    Offset(0, 7), // changes position of shadow
                              ),
                            ],
                            color: dataMeVaBe2[index].color,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          height: sizeHeight * 0.18,
                          width: sizeWidth,
                          child: Image.asset(
                            dataMeVaBe2[index].imageAsset,
                            scale: 3,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 14,
                                offset:
                                    Offset(0, 7), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    color: Colors.white,
                                    width: sizeWidth * 0.28,
                                    height: sizeHeight * 0.04,
                                    child: Text(
                                      dataMeVaBe2[index].name,
                                      style: TextStyle(
                                        color: Palette.text,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, //////////////////////////////////////
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    width: sizeWidth * 0.28,
                                    height: sizeHeight * 0.04,
                                    child: Text(
                                      dataMeVaBe2[index].price,
                                      style: TextStyle(
                                        color: Palette.textColor,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: sizeHeight * 0.08,
                                width: sizeWidth * 0.105,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: IconButton(
                                  icon: Image.asset('assets/buttons/show.png'),
                                  onPressed: () {
                                    launchWebUrl(dataMeVaBe2[index].link);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
