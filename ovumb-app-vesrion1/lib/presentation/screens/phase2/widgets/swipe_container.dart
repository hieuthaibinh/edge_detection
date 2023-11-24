
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_baby.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_mockham.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class SwipeContainer extends StatelessWidget {
  const SwipeContainer({
    Key? key,
    required this.size,
    required this.currentIndex,
    required this.ngayDuSinh,
  }) : super(key: key);

  final Size size;
  final int currentIndex;
  final DateTime ngayDuSinh;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 190,
      width: 500,
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            height: 180,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              //color: Colors.green,
              boxShadow: [
                BoxShadow(
                  color: whiteColor.withOpacity(0.2),
                  spreadRadius: 0.1,
                  blurRadius: 10,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/bg_detail.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: size.width,
            alignment: Alignment.topRight,
            child: Container(
              width: 150,
              margin: EdgeInsets.only(right: 0, top: 0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(dataBaby[currentIndex].imageAsset),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            color: Colors.transparent,
            height: 200,
            width: 325,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10),
                  padding: EdgeInsets.only(left: 25),
                  alignment: Alignment.topLeft,
                  color: Colors.transparent,
                  height: 35,
                  width: 1000,
                  child: Text(
                    "Bé yêu lớn bằng " + dataBaby[currentIndex].name,
                    style: TextStyle(
                      color: rose25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            dataBabyDetail[0].text,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            dataInforBaby[currentIndex].height.toString() +
                                ' cm',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            dataBabyDetail[1].text,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            dataInforBaby[currentIndex].weight.toString() +
                                ' gr',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        // can le trai cho cac thanh phan trong column
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            dataBabyDetail[2].text,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            (ngayDuSinh.difference(DateTime.now()))
                                    .inDays
                                    .toString() +
                                ' ngày',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 25,
                  ),
                  padding: EdgeInsets.only(left: 25),
                  alignment: Alignment.topLeft,
                  color: Colors.transparent,
                  height: 15,
                  width: size.width * 0.9,
                  child: Text(
                    '*Dữ liệu chỉ mang tính tham khảo',
                    style: TextStyle(
                      color: rose25,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}