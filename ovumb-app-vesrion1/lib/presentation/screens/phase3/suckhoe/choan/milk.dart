// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'dart:math' as math;
import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/widgets/bume_picker.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:vector_math/vector_math.dart' as vector;

int milkLeft = 0;
int milkRight = 0;
TimeOfDay timeMilk =
    TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
DateTime dateMilk = DateTime.now();
bool checkTimeChange = false;

class Milk extends StatefulWidget {
  final Con con;

  TextEditingController stopMilkController = TextEditingController();
  Milk({
    Key? key,
    required this.con,
    required this.stopMilkController,
  });
  @override
  _MilkState createState() => _MilkState();
}

class _MilkState extends State<Milk> with TickerProviderStateMixin {
  late AnimationController firstController0;
  late Animation<double> firstAnimation0;

  late AnimationController secondController0;
  late Animation<double> secondAnimation0;

  late AnimationController thirdController0;
  late Animation<double> thirdAnimation0;

  late AnimationController fourthController0;
  late Animation<double> fourthAnimation0;

  late AnimationController firstController1;
  late Animation<double> firstAnimation1;

  late AnimationController secondController1;
  late Animation<double> secondAnimation1;

  late AnimationController thirdController1;
  late Animation<double> thirdAnimation1;

  late AnimationController fourthController1;
  late Animation<double> fourthAnimation1;

  late AnimationController animationController1;
  late Animation<double> animation1;

  late AnimationController animationController2;
  late Animation<double> animation2;

  int second = 0;
  int minus = 0;
  MilkRepository _milkRepository = MilkRepository();
  List<String> textTitleMilk = ['Trái', 'Phải'];

  //  {}  []
  @override
  void initState() {
    isClearColor = false;
    widget.stopMilkController.addListener(() {
      animationController1.stop();
      animationController2.stop();
      // dataBuMe[0].isPlaying = false;
      // dataBuMe[1].isPlaying = false;
    });
    dataBuMe[0].isChinhSua = false;
    milkRight = 0;
    milkLeft = 0;
    animationController1 = AnimationController(
      duration: Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 360,
      vsync: this,
    );
    animationController2 = AnimationController(
      duration: Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 360,
      vsync: this,
    );
    animation1 = CurvedAnimation(
      parent: animationController1,
      curve: Curves.ease,
    );
    animationController1.stop();
    animation2 = CurvedAnimation(
      parent: animationController2,
      curve: Curves.ease,
    );
    animationController2.stop();
    super.initState();
    startTimer();

    firstController0 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    firstAnimation0 = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: firstController0, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController0.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController0.forward();
        }
      });

    secondController0 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    secondAnimation0 = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: secondController0, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController0.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController0.forward();
        }
      });

    thirdController0 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    thirdAnimation0 = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: thirdController0, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController0.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController0.forward();
        }
      });

    fourthController0 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    fourthAnimation0 = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: fourthController0, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController0.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController0.forward();
        }
      });

    Timer(Duration(seconds: 2), () {
      firstController0.forward();
    });

    Timer(Duration(milliseconds: 1600), () {
      secondController0.forward();
    });

    Timer(Duration(milliseconds: 800), () {
      thirdController0.forward();
    });

    fourthController0.forward();

    /////

    firstController1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    firstAnimation1 = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: firstController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController1.forward();
        }
      });

    secondController1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    secondAnimation1 = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: secondController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController1.forward();
        }
      });

    thirdController1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    thirdAnimation1 = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: thirdController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController1.forward();
        }
      });

    fourthController1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    fourthAnimation1 = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: fourthController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController1.forward();
        }
      });

    Timer(Duration(seconds: 2), () {
      if (!firstController0.isDismissed) {
        firstController0.forward();
      }
    });

    Timer(Duration(milliseconds: 1600), () {
      if (!secondController0.isDismissed) {
        secondController0.forward();
      }
    });

    Timer(Duration(milliseconds: 800), () {
      if (!thirdController0.isDismissed) {
        thirdController0.forward();
      }
    });
    if (!fourthController0.isDismissed) {
      fourthController0.forward();
    }

    Timer(Duration(seconds: 2), () {
      if (!firstController1.isDismissed) {
        firstController1.forward();
      }
    });

    Timer(Duration(milliseconds: 1600), () {
      if (!secondController1.isDismissed) {
        secondController1.forward();
      }
    });

    Timer(Duration(milliseconds: 800), () {
      if (!thirdController1.isDismissed) {
        thirdController1.forward();
      }
    });

    if (!fourthController1.isDismissed) {
      fourthController1.forward();
    }

    firstController0.stop();
    secondController0.stop();
    thirdController0.stop();
    fourthController0.stop();
    firstController1.stop();
    secondController1.stop();
    thirdController1.stop();
    fourthController1.stop();
  }

  Timer? countdownTimer;
  Duration duration1 = Duration(minutes: 0);
  Duration duration2 = Duration(minutes: 0);
  Duration durationTong = Duration(minutes: 0);

  void startTimer() {
    dataBuMe[0].isPlaying = false;
    dataBuMe[1].isPlaying = false;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setTimer());
  }

  void setTimer() {
    final addSecond1 = 1;
    final addSecond2 = 1;
    final addSecondTong = 1;
    if (dataBuMe[0].isChinhSua) {
      duration1 = Duration(seconds: milkRight);
      duration2 = Duration(seconds: milkLeft);
      durationTong =
          Duration(seconds: duration1.inSeconds + duration2.inSeconds);
    }
    if (dataBuMe[1].isPlaying == true && dataBuMe[0].isChinhSua == false) {
      final seconds1 = duration1.inSeconds + addSecond1;
      duration1 = Duration(seconds: seconds1);
    }
    if (dataBuMe[0].isPlaying == true && dataBuMe[0].isChinhSua == false) {
      final seconds2 = duration2.inSeconds + addSecond2;
      duration2 = Duration(seconds: seconds2);
    }
    if ((dataBuMe[1].isPlaying == true && dataBuMe[0].isChinhSua == false) ||
        (dataBuMe[0].isPlaying == true && dataBuMe[0].isChinhSua == false)) {
      final secondsTong = durationTong.inSeconds + addSecondTong;
      durationTong = Duration(seconds: secondsTong);
    }

    if (dataBuMe[0].isReload) {
      duration1 = Duration(seconds: 0);
      duration2 = Duration(seconds: 0);
      durationTong = Duration(seconds: 0);
    }
  }

  void setWave() {
    if (dataBuMe[0].isPlaying == false) {
      firstController0.stop();
      secondController0.stop();
      thirdController0.stop();
      fourthController0.stop();
    } else if (dataBuMe[0].isPlaying == true) {
      firstController0.reset();
      secondController0.reset();
      thirdController0.reset();
      fourthController0.reset();
    }
    if (dataBuMe[1].isPlaying == false) {
      firstController1.stop();
      secondController1.stop();
      thirdController1.stop();
      fourthController1.stop();
    } else if (dataBuMe[1].isPlaying == true) {
      firstController1.reset();
      secondController1.reset();
      thirdController1.reset();
      fourthController1.reset();
    }
  }

  @override
  void dispose() {
    /*Sử dụng mounted getter để kiểm tra trạng thái: Thay vì thực hiện công việc trong dispose(), bạn có thể sử dụng mounted getter để kiểm tra xem widget hoặc đối tượng của bạn có còn được gắn kết (mounted) trên cây widget không. Nếu widget đã bị xóa, mounted sẽ trả về false, và bạn có thể tránh thực hiện bất kỳ công việc nào trong trường hợp này.*/
    if (mounted) {
      firstController0.dispose();
      secondController0.dispose();
      thirdController0.dispose();
      fourthController0.dispose();
      firstController1.dispose();
      secondController1.dispose();
      thirdController1.dispose();
      fourthController1.dispose();
    }
    super.dispose();
  }

  bool isClearColor = false;

  Future<TimeOfDay?> _selectedTime(BuildContext context) async {
    final TimeOfDay? picker = await showTimePicker(
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
      initialTime: TimeOfDay.now(),
    );
    if (picker != null) {
      timeMilk = picker;
      checkTimeChange = true;
      // // DateTime date =
      // //     DateTime.parse(DateFormat('yyyy-MM-dd 00:00:00.000').format(picker));
      return timeMilk;
    }
    return null;
  }

  Future<DateTime?> _selectedDate(BuildContext context) async {
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
            datePickerTheme: DatePickerThemeData(
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
      initialDate: dateMilk,
      firstDate: widget.con.ngaySinh,
      lastDate: DateTime.now(),
    );
    if (picker != null) {
      dateMilk = DateTime(picker.year, picker.month, picker.day, timeMilk.hour,
          timeMilk.minute);
      return dateMilk;
    }
    return null;
  }

  String _parseDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _parseTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String strDigits1(int n) => n.toString().padLeft(2, '0');
    final minutes1 = strDigits1(duration1.inMinutes.remainder(60));
    final seconds1 = strDigits1(duration1.inSeconds.remainder(60));

    String strDigits2(int n) => n.toString().padLeft(2, '0');
    final minutes2 = strDigits2(duration2.inMinutes.remainder(60));
    final seconds2 = strDigits2(duration2.inSeconds.remainder(60));

    String strDigitsTong(int n) => n.toString().padLeft(2, '0');
    final minutesTong = strDigitsTong(durationTong.inMinutes.remainder(60));
    final secondsTong = strDigitsTong(durationTong.inSeconds.remainder(60));

    dataBuMe[1].second = seconds1;
    dataBuMe[1].minus = minutes1;
    dataBuMe[0].second = seconds2;
    dataBuMe[0].minus = minutes2;

    second = int.parse(dataBuMe[0].second) + int.parse(dataBuMe[1].second);
    minus = int.parse(dataBuMe[0].minus) + int.parse(dataBuMe[1].minus);

// [] {}

    dataBuMe[1].ml =
        ((int.parse(dataBuMe[1].second) + int.parse(dataBuMe[1].minus) * 60) *
                0.1)
            .toInt();
    dataBuMe[0].ml =
        ((int.parse(dataBuMe[0].second) + int.parse(dataBuMe[0].minus) * 60) *
                0.1)
            .toInt();
    int totalMl = dataBuMe[1].ml + dataBuMe[0].ml; // tổng int
    //((second + minus * 60) * 0.293).toInt();  //tổng double
    dataBuMe[0].totalMl = totalMl;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        height: 420,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: 360,
              color: Colors.transparent,
              child: Column(
                children: [
                  //lịch và chart
                  Container(
                    color: Colors.transparent,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _selectedDate(context);
                              },
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 9,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                width: 120,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/lich123.png',
                                      scale: 2.5,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _parseDate(dateMilk),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        color: grey400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _selectedTime(context);
                              },
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 9,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                width: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/time_add_icon.png',
                                      scale: 3,
                                      color: grey400,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _parseTime(timeMilk),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        color: grey400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 9,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          width: 40,
                          height: 40,
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/chart.png',
                              scale: 2.5,
                            ),
                            onPressed: () {
                              _milkRepository.getChoAnNgayTao(
                                maCon: widget.con.id,
                                maLoaiChoAn: [getMaChoAn(ChoAnEnum.bume)],
                                date: DateTime.now(),
                              );
                              context
                                  .read<ChoAnBloc>()
                                  .add(BuMeHistoryEvent(maCon: widget.con.id));

                              //Navigator.pushNamed(context, 'bieudotongquat');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //sữa
                  Container(
                    color: Colors.transparent,
                    height: 220,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        2,
                        (index) => Column(
                          children: [
                            TitleText(
                              text: textTitleMilk[index],
                              fontWeight: FontWeight.w500,
                              size: 16,
                              color: grey400,
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 183,
                              width: 150,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  //viền sau
                                  Container(
                                    margin: EdgeInsets.only(left: 11),
                                    height: 135,
                                    width: 135,
                                    decoration: BoxDecoration(
                                      color: dataBuMe[index].colorBackground,
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                  ),
                                  //sóng
                                  Positioned(
                                    top: 65,
                                    left: 79,
                                    child: isClearColor
                                        ? SizedBox()
                                        : ClipPath(
                                            clipper: CircleClipper(),
                                            child: CustomPaint(
                                              size: Size(140, 140),
                                              painter: index == 0
                                                  ? WavePainter1(
                                                      animationController1:
                                                          animationController1,
                                                      isRightDirection1: true)
                                                  : WavePainter2(
                                                      animationController2:
                                                          animationController2,
                                                      isRightDirection2: false),
                                            ),
                                          ),
                                  ),
                                  //sóng
                                  Positioned(
                                    top: 65,
                                    left: 79,
                                    child: isClearColor
                                        ? SizedBox()
                                        : ClipPath(
                                            clipper: CircleClipper(),
                                            child: CustomPaint(
                                              size: Size(140, 140),
                                              painter: index == 0
                                                  ? WavePainter1(
                                                      animationController1:
                                                          animationController1,
                                                      isRightDirection1: false)
                                                  : WavePainter2(
                                                      animationController2:
                                                          animationController2,
                                                      isRightDirection2: true),
                                            ),
                                          ),
                                  ),

                                  //nút playing
                                  Container(
                                    margin: EdgeInsets.only(top: 3, left: 13),
                                    height: 130,
                                    width: 130,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        overlayColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                      ),
                                      child: dataBuMe[index].isPlaying
                                          ? Image.asset(
                                              'assets/images/play1.png',
                                              scale: 3,
                                            )
                                          : Image.asset(
                                              'assets/images/pause1.png',
                                              scale: 3,
                                            ),
                                      onPressed: () {
                                        // bool remove màu khi ấn nút làm mới
                                        isClearColor = false;
                                        // dataBuBinh[0].value = dataBuBinh[0].value;
                                        // bool load lại thời gian sau khi ấn nút làm mới
                                        dataBuMe[0].isReload = false;
                                        dataBuMe[index].isPlaying =
                                            !dataBuMe[index].isPlaying;
                                        if (dataBuMe[0].isPlaying == false) {
                                          animationController1.stop();
                                        } else if (dataBuMe[0].isPlaying ==
                                            true) {
                                          animationController1.repeat();
                                          dataBuMe[0].isChinhSua = false;
                                        }
                                        if (dataBuMe[1].isPlaying == false) {
                                          animationController2.stop();
                                        } else if (dataBuMe[1].isPlaying ==
                                            true) {
                                          animationController2.repeat();
                                          dataBuMe[0].isChinhSua = false;
                                        }
                                        //hàm dừng hoặc run sóng khi ấn nút play
                                        //setWave();
                                        setState(() {});
                                      },
                                    ),
                                  ),

                                  //thời gian
                                  Positioned(
                                    top: 146,
                                    left: 60,
                                    child: Column(
                                      children: [
                                        Text(
                                          dataBuMe[0].isReload
                                              ? '00:00'
                                              : dataBuMe[index].minus +
                                                  ':' +
                                                  dataBuMe[index].second,
                                          style: TextStyle(
                                            color: grey700,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          //////
                                          dataBuMe[index].ml.toString() + 'ml',
                                          style: TextStyle(
                                            color: grey400,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ml
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tổng',
                        style: TextStyle(
                          color: grey400,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        minutesTong + ':' + secondsTong,
                        style: TextStyle(
                          color: grey700,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '(' + totalMl.toString() + 'ml' + ')',
                        style: TextStyle(
                          color: grey400,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: grey400),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              dataBuMe[0].iconButton,
                              scale: 3,
                            ),
                            Text(
                              //'ok',
                              dataBuMe[0].textButton,
                              style: TextStyle(
                                color: grey400,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          // isChinhSua = true;
                          dataBuMe[0].isPlaying = false;
                          dataBuMe[1].isPlaying = false;
                          dataBuMe[0].isChinhSua = true;
                          dataBuMe[0].isReload = false;

                          animationController1.stop();
                          animationController2.stop();

                          showModalBottomSheet(
                            // isDismissible: false,
                            // enableDrag: false,
                            backgroundColor: Colors.amber,
                            barrierColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return BuMePicker();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: grey400),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              dataBuMe[1].iconButton,
                              scale: 3,
                            ),
                            Text(
                              //'ok',
                              dataBuMe[1].textButton,
                              style: TextStyle(
                                color: grey400,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          isClearColor = true;
                          dataBuMe[1].isPlaying = false;
                          dataBuMe[0].isPlaying = false;
                          dataBuMe[0].isReload = true;
                          totalMl = 0;
                          milkLeft = 0;
                          milkRight = 0;
                          dataBuMe[1].ml = 0;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..addOval(Rect.fromCenter(
        center: Offset(0, 0),
        width: size.width - 20,
        height: size.height - 20));
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WavePainter1 extends CustomPainter {
  AnimationController animationController1;
  final bool isRightDirection1;
  WavePainter1(
      {required this.isRightDirection1, required this.animationController1});
  //static const int kWaveLength = 180;
  @override
  void paint(Canvas canvas, Size size) {
    double xOffset = size.width / 2;
    List<Offset> polygonOffsets = [];

    for (int i = -xOffset.toInt(); i <= xOffset; i++) {
      polygonOffsets.add(Offset(
          i.toDouble(),
          isRightDirection1
              ? math.sin(vector.radians(i.toDouble() * 360 / 290) -
                          vector.radians(animationController1.value)) *
                      11 -
                  2
              : math.sin(vector.radians(i.toDouble() * 360 / 290) +
                          vector.radians(animationController1.value)) *
                      11 -
                  2));
    }

    final Gradient gradient = LinearGradient(
        begin: Alignment(-1.0, -1.0), //top
        end: Alignment(-1.0, 1.0), //center
        colors: <Color>[violet500, violet300],
        stops: [isRightDirection1 ? 0.1 : 0.4, isRightDirection1 ? 0.9 : 1]);
    final wave = Path();
    wave.addPolygon(polygonOffsets, false);
    wave.lineTo(xOffset, 60);
    wave.lineTo(-xOffset, 60);
    wave.close();

    final rect = Rect.fromLTWH(
        0.0,
        isRightDirection1 ? -size.height / 5 - 5 : -size.height / 5 - 5,
        size.width,
        size.height / 2);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    //  canvas.drawRect(rect, paint);
    canvas.drawPath(wave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class WavePainter2 extends CustomPainter {
  AnimationController animationController2;
  final bool isRightDirection2;
  WavePainter2(
      {required this.isRightDirection2, required this.animationController2});
  //static const int kWaveLength = 180;
  @override
  void paint(Canvas canvas, Size size) {
    double xOffset = size.width / 2;
    List<Offset> polygonOffsets = [];

    for (int i = -xOffset.toInt(); i <= xOffset; i++) {
      polygonOffsets.add(Offset(
          i.toDouble(),
          isRightDirection2
              ? math.sin(vector.radians(i.toDouble() * 360 / 290) -
                          vector.radians(animationController2.value)) *
                      11 -
                  2
              : math.sin(vector.radians(i.toDouble() * 360 / 290) +
                          vector.radians(animationController2.value)) *
                      11 -
                  2));
    }

    final Gradient gradient = LinearGradient(
        begin: Alignment(-1.0, -1.0), //top
        end: Alignment(-1.0, 1.0), //center
        colors: <Color>[rose400, rose300.withOpacity(0.5)],
        stops: [isRightDirection2 ? 0.1 : 0.4, isRightDirection2 ? 0.9 : 1]);
    final wave = Path();
    wave.addPolygon(polygonOffsets, false);
    wave.lineTo(xOffset, 60);
    wave.lineTo(-xOffset, 60);
    wave.close();

    final rect = Rect.fromLTWH(
        0.0,
        isRightDirection2 ? -size.height / 5 - 5 : -size.height / 5 - 5,
        size.width,
        size.height / 2);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    //  canvas.drawRect(rect, paint);
    canvas.drawPath(wave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
