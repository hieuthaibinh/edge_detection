// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_baby.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_mockham.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/date_utils.dart'
    as date_util;

class CalendarPhase2 extends StatefulWidget {
  int widgetId;
  int clickId;
  CalendarPhase2({super.key, required this.widgetId, required this.clickId});

  @override
  State<CalendarPhase2> createState() => _CalendarPhase2State();
}

class _CalendarPhase2State extends State<CalendarPhase2> {
  late ScrollController scrollController1;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller1 = TextEditingController();
  List<DateTime> currentDayList = List.empty();

//////
  late AnimationController controller;
  late Animation<double> animation;
  bool isCheckButton = false; // true => show button Chi tiet
  bool isShowDetail = false;
  bool isCheckBackButton = false;
  bool isShowBigDetail = false;
  int ngay = 0;
  int thang = 0;
  int tuanthai = 0;
  bool isPicker = false;

  List<String> name = [
    'assets/images/baby0.png',
    'assets/images/baby1.png',
    'assets/images/baby2.png',
    'assets/images/baby3.png',
    'assets/images/baby4.png',
    'assets/images/baby5.png',
    'assets/images/baby6.png',
    'assets/images/baby7.png',
    'assets/images/baby9.png',
  ];
  List<String> list = [];
  List<int> listMonth = [];
  int i = 0;
  int itemCount = 5; // your items count
  ScrollController _scrollController = ScrollController();
  int index = 2; // your item index to scroll
  late int centerPosition;

  TextEditingController controllerCalendar = TextEditingController();
  DateTime? datePicker;
  int? weeks;
  int? day;
  int? ngaybatdau;

  int value1 = 9;
  int value2 = 9;
  late int currentMonth;

  @override
  void initState() {
    currentMonth = widget.widgetId;
    dataBaby[widget.widgetId].isClickDay = false;
    currentMonthList = date_util.DateUtils.daysRange();
    showCurrentMonthOfBaby(1);
    //print(currentMonthList);
    // currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    // currentMonthList = currentMonthList.toSet().toList();
    scrollController1 =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  

  void calculatorDate(picker) {
    datePicker = DateTime.parse(picker.toString());
    Duration days = datePicker!.difference(DateTime.now());
    ngaybatdau = 280 - days.inDays;
    weeks = (ngaybatdau! ~/ 7);
    day = ngaybatdau! % 7;
    // ngayDuSinh-  ngay hien tai = so ngay con lai
    dataNgayDuSinh[0].ngayconlai = days.inDays;
  }

  showCurrentMonthOfBaby(int seconds) {
    for (int i = 0; i < 9; i++) {
      if (DateTime.now().month == dataCacThangCoBau[i].thang) {
        currentMonth = i;
      }
    }
    setState(() {});
  }

  showCenterPosition1() {
    if (widget.clickId == 0) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 0,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else if (widget.clickId == 1) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 0.17,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else if (widget.clickId == 2) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 0.585,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    } else if (widget.clickId == 3) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    } else if (widget.clickId == 4) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 1.45,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    } else if (widget.clickId == 5) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 1.88,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    } else if (widget.clickId == 6) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 2.3,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    } else if (widget.clickId == 7) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 2.74,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    } else if (widget.clickId == 8) {
      _scrollController.animateTo(MediaQuery.of(context).size.width * 3,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    //lưu ý: đối vs những TH load giao diện chậm thì đây là giải pháp
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 27),
          alignment: AlignmentDirectional.centerStart,
          //color: Colors.green,
          height: 80,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    //color: Colors.amber,
                    width: 250,
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Xin chào mẹ!',
                      style: TextStyle(
                        color: grey700,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    width: 250,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: size.height * 0.005),
                    child: RichText(
                      text: TextSpan(
                        text: 'Hiện tại là tháng thứ ',
                        children: [
                          TextSpan(
                            text: '${currentMonth + 1}',
                            style: TextStyle(
                              color: grey700,
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: ' của thai kỳ',
                                style: TextStyle(
                                  color: grey700,
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                        style: TextStyle(
                          color: grey700,
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, right: 10),
                alignment: Alignment.center,
                height: 50,
                width: size.width * 0.22,
                decoration: BoxDecoration(
                  color: grey100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.12,
                        color: Colors.transparent,
                        child: Text(
                          DateTime.now().month.toString() +
                              "/" +
                              DateTime.now().year.toString(),
                          //controllerCalendar.text,     (11)
                          style: TextStyle(
                            color: grey400,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/down1.png',
                        scale: 3,
                      ),
                    ],
                  ),
                  onPressed: () {
                    // dataBaby[widget.clickId].isClickDay = true;
                    // _selectedDateTime(context);
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, bottom: 10),
          width: double.infinity,
          height: 110,
          //color: Colors.amber,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: !checkTheSameDay(
                              currentMonthList[index], DateTime.now())
                          ? Colors.grey.withOpacity(0.15)
                          : rose400.withOpacity(0.45),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors:
                        checkTheSameDay(currentMonthList[index], DateTime.now())
                            ? [rose500, rose400]
                            : [whiteColor, whiteColor],
                  ),
                ),
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                height: 80,
                width: 48,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //1 - list các thứ trong tuần vs show thứ hiện tại
                      //Radio(),
                      Text(
                        date_util.DateUtils
                            .weekdays[currentMonthList[index].weekday - 1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !checkTheSameDay(
                                  currentMonthList[index], DateTime.now())
                              ? grey400
                              : Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      //2 - list các ngày trong tuần vs show ngày hiện tại
                      //1 và 2 tương đương nhau
                      Text(
                        !checkTheSameDay(currentMonthList[index], DateTime.now())
                            ? currentMonthList[index].day.toString()
                            : currentMonthList[index].day.toString() + '*',
                        style: TextStyle(
                          color: !checkTheSameDay(
                                  currentMonthList[index], DateTime.now())
                              ? grey700
                              : Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    // value1 = index;
                    // value2 = index;
                    // print(currentMonthList[index].month.toString() +
                    //     '/' +
                    //     currentMonthList[index].year.toString());
                    // //dataBaby[index].idCheck != 1;
                    // // in ra thang thu may cua thai ky
                    // dataBaby[widget.clickId].isClickDay = false;
                    // isPicker = false;
                    // if (index == 0) {}
                    // widget.clickId = index;
                    // showCenterPosition1();
                    // if (widget.clickId == 0 ||
                    //     widget.clickId == 2 ||
                    //     widget.clickId == 5 ||
                    //     widget.clickId == 8) {
                    //   _matchEngine.currentItem?.like();
                    // } else if (widget.clickId == 1 ||
                    //     widget.clickId == 3 ||
                    //     widget.clickId == 6 ||
                    //     widget.clickId == 4 ||
                    //     widget.clickId == 7) {
                    //   _matchEngine.currentItem?.nope();
                    // }
                    // setState(() {});
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
