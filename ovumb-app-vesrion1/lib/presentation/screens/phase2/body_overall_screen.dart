import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/logic/ads/ads.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/mockham_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_baby.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_mockham.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/ngaydusinh_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

import 'body_detail_screen.dart';
import 'widgets/swipe_container.dart';

class BodyOverall extends StatefulWidget {
  int clickId;
  int widgetId;
  DateTime ngayDuSinh;
  BodyOverall({
    Key? key,
    required this.widgetId,
    required this.ngayDuSinh,
    required this.clickId,
  }) : super(key: key);

  @override
  State<BodyOverall> createState() => _BodyOverallState();
}

class _BodyOverallState extends State<BodyOverall>
    with TickerProviderStateMixin {
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
  bool isCheck = false;

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
  ScrollController _scrollTextController = ScrollController();
  PageController _pageController = PageController();
  int index = 2; // your item index to scroll
  late int centerPosition;

  double _height0 = 190;
  double _width0 = 380;

  double _height1 = 125;
  double _width1 = 125;

  double _height2 = 140;
  double _width2 = 140;

  TextEditingController controllerCalendar = TextEditingController();
  DateTime? datePicker;
  int? weeks;
  int? day;
  int? ngaybatdau;
  DateTime? ngaybatdau1;

  int value1 = 9;
  int value2 = 9;
  DateTime a = DateTime.now();

  List<DateTime> thangList = [];
  List<DateTime> uyen = [];
  int index2 = 0;
  int j = 0;
  int k = 0;
  late int currentIndex;
  late int currentMonth;
  DateTime? dayPicker = DateTime.now();

  @override
  void initState() {
    showAds(context: context, isToday: true, type: 0);
    currentIndex = widget.widgetId;
    currentMonth = widget.widgetId;

    //cuộn đến tháng hiện tại
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDayOfBaby();
    });
    showTextDays();
    controllerCalendar.text = DateFormat.yM().format(DateTime.now());
    dataBaby[widget.widgetId].isClickDay = false;
    //currentMonthList = date_util.DateUtils.daysRange();
    scrollController1 =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  showCurrentMonthOfBaby(int seconds) {
    List<double> space = [0, 0.17, 0.585, 1, 1.45, 1.88, 2.3, 2.74, 3];
    for (int i = 0; i < 9; i++) {
      if (DateTime.now().month == dataCacThangCoBau[i].thang) {
        currentIndex = i;
        currentMonth = i;
        _scrollController.animateTo(
            MediaQuery.of(context).size.width * space[i],
            duration: Duration(milliseconds: seconds),
            curve: Curves.ease);
      }
    }
    setState(() {});
  }

  showCenterPosition() {
    List<double> space = [0, 0.17, 0.585, 1, 1.45, 1.88, 2.3, 2.74, 3];
    for (int i = 0; i < 9; i++) {
      if (currentIndex == i) {
        _scrollController.animateTo(
          MediaQuery.of(context).size.width * space[i],
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    }
    setState(() {});
  }

  showCenterText() {
    for (int i = 0; i < 9; i++) {
      if (currentIndex == i) {
        _scrollTextController.animateTo(
          (60 * 31 * i).toDouble(),
          duration: Duration(milliseconds: 2500),
          curve: Curves.ease,
        );
      }
    }
    setState(() {});
  }

  void showDayOfBaby() {
    // if (dataNgayDuSinh[0].ngaydusinh != null) {}
    DateTime result9 = widget.ngayDuSinh;
    DateTime result8 = result9.subtract(Duration(days: 31));
    DateTime result7 = result8.subtract(Duration(days: 31));
    DateTime result6 = result7.subtract(Duration(days: 31));
    DateTime result5 = result6.subtract(Duration(days: 31));
    DateTime result4 = result5.subtract(Duration(days: 31));
    DateTime result3 = result4.subtract(Duration(days: 31));
    DateTime result2 = result3.subtract(Duration(days: 31));
    DateTime result1 = result2.subtract(Duration(days: 31));

    thangList.addAll([
      result1,
      result2,
      result3,
      result4,
      result5,
      result6,
      result7,
      result8,
      result9,
    ]);

    // for (int i = 0; i < 9; i++) {
    //   dataCacThangCoBau[i].thang = thangList[i].month;
    // }

    dataCacThangCoBau[8].thang = result9.month;
    dataCacThangCoBau[7].thang = result8.month;
    dataCacThangCoBau[6].thang = result7.month;
    dataCacThangCoBau[5].thang = result6.month;
    dataCacThangCoBau[4].thang = result5.month;
    dataCacThangCoBau[3].thang = result4.month;
    dataCacThangCoBau[2].thang = result3.month;
    dataCacThangCoBau[1].thang = result2.month;
    dataCacThangCoBau[0].thang = result1.month;

    dataCacThangCoBau[8].ngay = result9.day;
    dataCacThangCoBau[7].ngay = result8.day;
    dataCacThangCoBau[6].ngay = result7.day;
    dataCacThangCoBau[5].ngay = result6.day;
    dataCacThangCoBau[4].ngay = result5.day;
    dataCacThangCoBau[3].ngay = result4.day;
    dataCacThangCoBau[2].ngay = result3.day;
    dataCacThangCoBau[1].ngay = result2.day;
    dataCacThangCoBau[0].ngay = result1.day;

    showCurrentMonthOfBaby(1000);
  }

  showTextDays() {
    DateTime first = widget.ngayDuSinh.subtract(Duration(days: 280));

    List<DateTime> res = [];
    for (int j = 0; j < 9; j++) {
      for (int i = 0; i < 31; i++) {
        res.add(first);
        first = first.add(Duration(days: 1));
      }
      dataListDays[j].ListOfDays1 = res;
      res = [];
      //res.clear();
    }
  }

  zoomListImage() {
    if (_height0 == 190 || _height1 == 125 || _height2 == 140) {
      setState(() {
        _height0 = 180;
        _width0 = 365;
        _height1 = 68;
        _width1 = 68;
        _height2 = 80;
        _width2 = 80;
      });
    } else {
      setState(() {
        _height0 = 190;
        _width0 = 380;
        _height1 = 125;
        _width1 = 125;
        _height2 = 140;
        _width2 = 140;
      });
    }
  }

  _selectedDateTime(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      builder: (context1, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: rose400, // header background color
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      // initialDate: widget.ngayDuSinh ??
      //     DateTime.now(), // if - null: TH con của toán tử 3 ngôi
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picker != null) {
      isPicker = true;
      String formattedDate = DateFormat("MM/yyyy").format(picker);
      calculatorDate(picker);
      //dataNgayDuSinh[widget.widgetId].ngayconlai = days.inDays;
      setState(() {
        // isShowPicker = true;
        controllerCalendar.text =
            formattedDate.toString(); // show ngay ra ở ô textfeild
        print(controllerCalendar.text);
      });
    } else {
      print('null');
    }
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: ListView(
        physics: ClampingScrollPhysics(),
        key: PageStorageKey<String>('page'),
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
                  width: 95,
                  decoration: BoxDecoration(
                    color: grey100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dataListDays[currentIndex]
                                  .ListOfDays1[0]
                                  .month
                                  .toString() +
                              "/" +
                              dataListDays[currentIndex]
                                  .ListOfDays1[0]
                                  .year
                                  .toString(),
                          //controllerCalendar.text,     (11)
                          style: TextStyle(
                            color: grey400,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Image.asset(
                          'assets/images/down1.png',
                          scale: 3,
                        ),
                      ],
                    ),
                    onPressed: () {
                      dataBaby[widget.clickId].isClickDay = true;
                      _selectedDateTime(context);
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
              physics: const ClampingScrollPhysics(),
              controller: _scrollTextController,
              scrollDirection: Axis.horizontal,
              itemCount: dataListDays.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 60 * dataListDays[index].ListOfDays1.length.toDouble(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: dataListDays[index].ListOfDays1.length,
                    itemBuilder: (context, i) {
                      //print(dataListDays[index].ListOfDays1[i]);
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: dayPicker != null
                                ? checkTheSameDay(
                                        dataListDays[index].ListOfDays1[i],
                                        dayPicker!)
                                    ? rose400
                                    : (checkTheSameDay(
                                            dataListDays[index].ListOfDays1[i],
                                            DateTime.now())
                                        ? rose300
                                        : whiteColor)
                                : (checkTheSameDay(
                                        dataListDays[index].ListOfDays1[i],
                                        DateTime.now())
                                    ? rose300
                                    : whiteColor),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: dayPicker != null
                                  ? checkTheSameDay(
                                          dataListDays[index].ListOfDays1[i],
                                          dayPicker!)
                                      ? whiteColor
                                      : grey100
                                  : (checkTheSameDay(
                                          dataListDays[index].ListOfDays1[i],
                                          DateTime.now())
                                      ? whiteColor
                                      : grey100),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: dayPicker != null
                                ? checkTheSameDay(
                                        dataListDays[index].ListOfDays1[i],
                                        dayPicker!)
                                    ? [rose500, rose400]
                                    : [whiteColor, whiteColor]
                                : [whiteColor, whiteColor],
                          ),
                        ),
                        margin: EdgeInsets.only(
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        height: 80,
                        width: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                //date_util.DateUtils.weekdays[]
                                convertWeekDay(
                                    dataListDays[index].ListOfDays1[i].weekday),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: dayPicker != null
                                      ? checkTheSameDay(
                                              dataListDays[index]
                                                  .ListOfDays1[i],
                                              dayPicker!)
                                          ? whiteColor
                                          : grey400
                                      : grey400,
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                checkTheSameDay(
                                        dataListDays[index].ListOfDays1[i],
                                        dayPicker!)
                                    ? dataListDays[index]
                                            .ListOfDays1[i]
                                            .day
                                            .toString() +
                                        '*'
                                    : dataListDays[index]
                                        .ListOfDays1[i]
                                        .day
                                        .toString(),
                                style: TextStyle(
                                  color: dayPicker != null
                                      ? checkTheSameDay(
                                              dataListDays[index]
                                                  .ListOfDays1[i],
                                              dayPicker!)
                                          ? whiteColor
                                          : grey700
                                      : grey700,
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            // // lấy id của tháng làm id check
                            currentIndex = index;
                            dayPicker = dataListDays[index].ListOfDays1[i];
                            isCheck = true;
                            showCenterPosition();
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 12,
                    offset: Offset(1, 5),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/kham1.png',
                      scale: 3,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mốc khám, siêu âm',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: rose400,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            currentMonth == 0
                                ? 'Lần khám thai thứ ${currentMonth + 1} của thai kỳ'
                                : 'Lần khám thai thứ ${currentMonth} của thai kỳ',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: rose400,
                              height: 1.3,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MocKhamScreen(
                      widgetId:
                          currentMonth == 0 ? currentMonth + 1 : currentMonth),
                ),
              );
            },
          ),
          //const SizedBox(height: 20),
          Container(
            width: size.width,
            height: 570,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Transform.scale(
                    scale: 1.8,
                    child: Container(
                      height: 900,
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [rose300, rose600],
                        ),
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(50),
                        //   topRight: Radius.circular(50),
                        // ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 220,
                    width: size.width,
                    child: SwipeContainer(
                      size: size,
                      currentIndex: currentMonth,
                      ngayDuSinh: widget.ngayDuSinh,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    height: 280,
                    width: size.width,
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 210,
                          width: 170,
                          color: Colors.transparent,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // ảnh
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  /* với những TH mà muốn set vị trí cô định của vật,
                                        thì nên đặt height hoặc width cố định
                                        */

                                  height: 140,
                                  width: currentIndex == index ? _width2 : 80,
                                  child: Container(
                                    color: Colors.transparent,
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      dataBaby1[index].imageAsset,
                                    ),
                                  ),
                                ),
                                // thanh dọc trắng, tháng thứ vào button chi
                                Container(
                                  height: 120,
                                  width: 110,
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.only(left: 6, top: 7),
                                        height: 20,
                                        width: 120,
                                        color: Colors.transparent,
                                        child: Text(
                                          'Tháng thứ ' +
                                              dataBaby[index]
                                                  .tuanthai
                                                  .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: currentIndex == index
                                                  ? FontWeight.w600
                                                  : FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                      if (currentIndex == index)
                                        Container(
                                          height: 30,
                                          width: 100,
                                          margin: EdgeInsets.only(
                                              top: size.height * 0.018),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          child: ElevatedButton(
                                            style: const ButtonStyle(
                                              overlayColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent),
                                              shadowColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent),
                                            ),
                                            child: Text(
                                              'Chi tiết',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Color(0xFFFC6F8D),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                //isShowDetail = true;
                                                dataBaby[widget.widgetId].id =
                                                    dataBaby[index].tuanthai -
                                                        1;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        BodyDetailScreen(
                                                      widgetId: dataBaby[index]
                                                              .tuanthai -
                                                          1,
                                                      ngayDuSinh:
                                                          widget.ngayDuSinh,
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              isCheck = true;
                              currentIndex = index;
                              if (!dataListDays[currentIndex]
                                  .ListOfDays1
                                  .contains(dayPicker)) {
                                dayPicker =
                                    dataListDays[currentIndex].ListOfDays1[0];
                                showCenterText();
                              }
                              showCenterPosition();

                              for (i = 0; i < dataBaby.length; i++) {
                                dataBaby[i].idCheck = 0;
                                zoomListImage();

                                ///swipe pageview ở đây
                                showCenterPosition();

                                //setState(() {});
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // button chỉnh sửa
                Positioned(
                  top: 470,
                  child: Container(
                    height: 40,
                    width: size.width,
                    alignment: Alignment.center,
                    child: Container(
                      height: 43,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/setting.png',
                              scale: 3,
                            ),
                            Text(
                              'Chỉnh sửa',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          String? id = await SharedPreferencesService.getId();
                          Navigator.pushNamed(
                            context,
                            NgayDuSinhScreen.routeName,
                            arguments: {
                              'maNguoiDung': id,
                              'ngayDuSinh': widget.ngayDuSinh,
                            },
                          );
                        },
                      ),
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

class Content {
  final String text;
  Content({required this.text});
}

class DataListDays {
  final int id;
  List<DateTime> ListOfDays1;
  DataListDays(this.id, this.ListOfDays1);
}

List<DataListDays> dataListDays = [
  DataListDays(0, []),
  DataListDays(1, []),
  DataListDays(2, []),
  DataListDays(3, []),
  DataListDays(4, []),
  DataListDays(5, []),
  DataListDays(6, []),
  DataListDays(7, []),
  DataListDays(8, []),
];
