import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_test.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Test extends StatefulWidget {
  final int titleId;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const Test({super.key, required this.titleId, required this.scaffoldKey});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Container(
            color: Colors.white,
            child: ElevatedButton.icon(
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              icon: const SizedBox(
                height: 20,
                width: 20,
                child: ImageIcon(
                  AssetImage('assets/icons/back_button.png'),
                  color: Color(0xfffd6f8e),
                ),
              ),
              onPressed: () {},
              // onPressed: () async {
              //   await _saveLocalData(widget.date, connected, context);
              // },
              label: const Text(''),
            ),
          ),
          title: Container(
            //color: Colors.amber,
            alignment: Alignment.center,
            child: Text(
              'Quản lý que test',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  color: rose400),
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: Image.asset(
                'assets/icons/right_home_icon.png',
                scale: 3,
              ),
            ),
          ],
        ),
        body: Container(
          height: sizeHeight,
          width: sizeWidth,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg1.png'),
                    ),
                  ),
                  width: sizeWidth,
                  height: sizeHeight * 0.3,
                  child: Column(
                    //bo que test cac thu
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 25),
                        //color: Colors.yellow,
                        width: sizeWidth,
                        height: sizeHeight * 0.08,
                        child: Text(
                          'Bổ sung lượt test',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        //color: Colors.green,
                        height: sizeHeight * 0.08,
                        width: sizeWidth,
                        child: Text(
                          'Quét mã trên hộp để thêm lượt Test\nBổ sung thêm que nếu que của bạn đã hết nhé!',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          width: sizeWidth,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  //color: Colors.amber,
                                  width: sizeWidth * 0.33,
                                  height: sizeHeight * 0.06,
                                  child: Image.asset(
                                    'assets/images/qr_code.png',
                                    height: sizeHeight * 0.07,
                                    width: sizeWidth * 0.07,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  //color: Colors.green,
                                  width: sizeWidth * 0.33,
                                  height: sizeHeight * 0.06,
                                  child: Text(
                                    'Quét mã QR',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: rose500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {},
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: sizeHeight * 0.45,
                child: Container(
                  width: sizeWidth,
                  height: sizeHeight * 0.7,
                  color: Colors.white,
                  child: ListView(
                    //physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 150),
                        padding: EdgeInsets.only(left: 20),
                        height: sizeHeight * 0.04,
                        width: sizeWidth,
                        //color: Colors.green,
                        child: Text(
                          'Mua thêm Que',
                          style: TextStyle(
                              color: Palette.text,
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        height: sizeHeight * 0.278,
                        width: sizeWidth,
                        //color: Colors.blue,
                        child: ListView.builder(
                          //physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(right: 16),
                              width: sizeWidth * 0.385,
                              decoration: BoxDecoration(
                                //color: Color(0xffffe4e8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffffe4e8),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: sizeHeight * 0.18,
                                    width: sizeWidth,
                                    child: //Image.asset(dataTest[0].imageAsset),
                                        Image.asset(dataTest[index].imageAsset),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          //spreadRadius: 1,
                                          offset: Offset(2, 3),
                                          color: Colors.grey.withOpacity(0.15),
                                          blurRadius: 7.0,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, top: 10),
                                              color: Colors.white,
                                              width: sizeWidth * 0.26,
                                              height: sizeHeight * 0.04,
                                              child: Text(
                                                //'ok',
                                                dataTest[index].name,
                                                style: TextStyle(
                                                  color: Palette.text,
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .white, //////////////////////////////////////
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                              width: sizeWidth * 0.26,
                                              height: sizeHeight * 0.04,
                                              child: Text(
                                                //'ok',
                                                dataTest[index].price,
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
                                          width: sizeWidth * 0.125,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              'assets/buttons/show.png',
                                            ),
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
              ),
              Positioned(
                top: sizeHeight * 0.32,
                left: 20,
                right: 20,
                child: Container(
                  padding: EdgeInsets.only(top: sizeHeight * 0.035),
                  width: sizeWidth,
                  height: sizeHeight * 0.26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        //spreadRadius: 1,
                        offset: Offset(2, 3),
                        color: Colors.grey.withOpacity(0.25),
                        blurRadius: 9.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 11, left: 20),
                        //color: Colors.amber,
                        height: sizeHeight * 0.035,
                        width: sizeWidth,
                        child: Text(
                          'Số lần Test của bạn',
                          style: TextStyle(
                            color: Palette.text,
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        //color: Colors.yellow,
                        height: sizeHeight * 0.17,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              color: Colors.transparent,
                              width: sizeWidth * 0.25,
                              height: sizeHeight * 0.15,
                              child: CircularPercentIndicator(
                                circularStrokeCap: CircularStrokeCap.round,
                                radius: 51.0,
                                lineWidth: 9.0,
                                percent: 0.8,
                                center: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 45),
                                      child: Text(
                                        dataTestPercent[0].useOvumb,
                                        style: TextStyle(
                                          color: Palette.text,
                                          fontFamily: 'Inter',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        dataTestPercent[0].totalOvumb,
                                        style: TextStyle(
                                          color: Palette.text,
                                          fontFamily: 'Inter',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Color(0xfff2f4f7),
                                linearGradient: dataTestPercent[0]
                                    .progressColor, //mau phan tram
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25, right: 5),
                              //color: Colors.amber,
                              width: sizeWidth * 0.25,
                              child: CircularPercentIndicator(
                                circularStrokeCap: CircularStrokeCap.round,
                                radius: 51.0,
                                lineWidth: 9.0,
                                percent: 0.90,
                                center: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 45),
                                      child: Text(
                                        dataTestPercent[1].useOvumb,
                                        style: TextStyle(
                                          color: Palette.text,
                                          fontFamily: 'Inter',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        dataTestPercent[1].totalOvumb,
                                        style: TextStyle(
                                          color: Palette.text,
                                          fontFamily: 'Inter',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Color(0xfff2f4f7),
                                linearGradient:
                                    dataTestPercent[1].progressColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: sizeWidth * 0.25,
                              //color: Colors.blue,
                              child: Column(
                                children: [
                                  Container(
                                    height: sizeHeight * 0.085,
                                    //color: Colors.amber,
                                    child: Row(
                                      children: [
                                        //ô tròn màu
                                        Container(
                                          height: 23,
                                          width: 23,
                                          decoration: BoxDecoration(
                                              //color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(colors: [
                                                Color(0xff6941c6),
                                                Color(0xffb692f6)
                                              ])),
                                        ),
                                        //cột text chi tiết
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 16),
                                                //color: Colors.orange,
                                                height: sizeHeight * 0.04,
                                                child: Text(
                                                  dataTestNote[0].title,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 4),
                                                //color: Colors.grey,
                                                height: sizeHeight * 0.04,
                                                child: Text(
                                                  dataTestNote[0].describe,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w700,
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
                                    height: sizeHeight * 0.085,
                                    //color: Colors.brown,
                                    child: Row(
                                      children: [
                                        //ô tròn màu
                                        Container(
                                          height: 23,
                                          width: 23,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: dataTestPercent[1]
                                                  .progressColor),
                                        ),
                                        //cột text chi tiết
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 16),
                                                //color: Colors.orange,
                                                height: 30,
                                                child: Text(
                                                  dataTestNote[1].title,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 13),
                                                padding:
                                                    EdgeInsets.only(top: 4),
                                                //color: Colors.grey,
                                                height: sizeHeight * 0.04,
                                                child: Text(
                                                  dataTestNote[1].describe,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
