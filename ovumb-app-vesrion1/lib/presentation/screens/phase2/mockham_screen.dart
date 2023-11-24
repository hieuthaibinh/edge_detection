import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_mockham.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';

///  [] {}

import '../../utils/color.dart';
import 'calendar_phase2.dart';

// ignore: must_be_immutable
class MocKhamScreen extends StatefulWidget {
  int widgetId;
  MocKhamScreen({
    super.key,
    required this.widgetId,
  });

  @override
  State<MocKhamScreen> createState() => _MocKhamScreenState();
}

class _MocKhamScreenState extends State<MocKhamScreen> {
  bool isClick = false;
  late int selectedId;
  DateTime today = DateTime.now();
  bool isReverse = false; // true thi dao lai va button mau rose400
  double scaleReverse = 1;
  ScrollController _scrollController = ScrollController();
  int currentMonth = 1;
  double _height = 123;
  //File? image;

  List<String> name = [
    'Lần khám 1',
    'Lần khám 2',
    'Lần khám 3',
    'Lần khám 4',
    'Lần khám 5',
    'Lần khám 6',
    'Lần khám 7',
  ];
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    showCurrentMonth(2);
    addHeight();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //showCurrentMonthOfBaby();
    });
    //newList();
  }

  // hàm show tháng hiện tại là lần khám thứ mấy
  showCurrentMonthOfBaby() {
    if (isClick == false) {
      if (DateTime.now().month == dataCacThangCoBau[0].thang ||
          DateTime.now().month == dataCacThangCoBau[1].thang ||
          DateTime.now().month == dataCacThangCoBau[2].thang) {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      } else if (DateTime.now().month == dataCacThangCoBau[4].thang ||
          DateTime.now().month == dataCacThangCoBau[5].thang ||
          DateTime.now().month == dataCacThangCoBau[6].thang) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      } else if (DateTime.now().month == dataCacThangCoBau[3].thang) {
        _scrollController.animateTo(700,
            duration: const Duration(seconds: 1), curve: Curves.easeIn);
      }
    }
  }

  showCurrentMonth(int seconds) {
    for (int i = 0; i < 9; i++) {
      if (DateTime.now().month == dataCacThangCoBau[i].thang) {
        currentMonth = i;
      }
    }
    setState(() {});
  }

  addHeight() {
    for (int i = 1; i < 10; i++) {
      _height = _height * i;
      //print(_height);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Size screenSize = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: GlobalDrawer(
          size: screenSize,
          scaffoldKey: scaffoldKey,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Mốc Khám, Siêu Âm',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              fontSize: 18,
              color: grey700,
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
        ),
        body: Column(
          children: [
            CalendarPhase2(
              widgetId: widget.widgetId,
              clickId: 0,
            ),
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  key: PageStorageKey<String>('page'),
                  //physics: NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Thời gian',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: grey400,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lần khám',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: grey400,
                                ),
                              ),
                              Transform.scale(
                                scaleY: scaleReverse,
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/more.png',
                                    scale: 2.5,
                                    color:
                                        isReverse ? rose400 : Color(0xff98a2b3),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isReverse = !isReverse;
                                      if (isReverse == false) {
                                        scaleReverse = 1;
                                      } else {
                                        scaleReverse = -1;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            ListView.builder(
                              key: PageStorageKey<String>('page'),
                              controller: _scrollController,
                              reverse:
                                  isReverse, // dao nguoc cac phan tu trong list
                              physics: BouncingScrollPhysics(),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    bottom: isReverse
                                        ? (index == 0 ? 30 : 0)
                                        : (index == 7 ? 30 : 0),
                                  ),
                                  color: Colors.transparent,
                                  height: dataMocKham[index].isShowDetail
                                      ? 180
                                      : 57,
                                  width: size.width,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              'Tháng ' +
                                                  dataCacThangCoBau[index]
                                                      .thang
                                                      .toString(),
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: grey700,
                                              ),
                                            ),
                                            Text(
                                              'Ngày ' +
                                                  dataCacThangCoBau[index]
                                                      .ngay
                                                      .toString(),
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grey400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            dataMocKham[index].isShowDetail =
                                                !dataMocKham[index]
                                                    .isShowDetail;
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            decoration:
                                                //list.contains(name[index].toString())
                                                (currentMonth - 1 == index)
                                                    ? BoxDecoration(
                                                        color: rose400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      )
                                                    : BoxDecoration(
                                                        color:
                                                            Color(0xfff2f4f7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                            width: size.width * 0.58,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 18),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Lần khám " +
                                                          dataMocKham[index]
                                                              .lanKham
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        color:
                                                            (currentMonth - 1 ==
                                                                    index)
                                                                ? Colors.white
                                                                : grey700,
                                                      ),
                                                    ),
                                                    Transform.rotate(
                                                      angle: dataMocKham[index]
                                                              .isShowDetail
                                                          ? 3.14
                                                          : 0,
                                                      child: Image.asset(
                                                        'assets/images/down.png',
                                                        scale: 3,
                                                        color:
                                                            (currentMonth - 1 ==
                                                                    index)
                                                                ? Colors.white
                                                                : rose400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                dataMocKham[index].isShowDetail
                                                    ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            //color: Colors.amber,

                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              dataMocKham[index]
                                                                  .chiTiet,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: TextStyle(
                                                                height: 1.35,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                                color: (currentMonth -
                                                                            1 ==
                                                                        index)
                                                                    ? Colors
                                                                        .white
                                                                    : grey700,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: const VerticalDivider(
                                        color: grey300,
                                        width: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(flex: 2, child: const SizedBox()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
