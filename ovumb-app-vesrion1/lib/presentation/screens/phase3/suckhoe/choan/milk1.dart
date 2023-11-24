// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/model_choan.dart';

class Milk1 extends StatefulWidget {
  int widgetId;
  double ml;
  List<Color> colors;
  Milk1({
    Key? key,
    required this.widgetId,
    required this.ml,
    required this.colors,
  }) : super(key: key);
  @override
  _Milk1State createState() => _Milk1State();
}

class _Milk1State extends State<Milk1> with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  @override
  void initState() {
    super.initState();
    startTimer();
    firstController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    firstAnimation = Tween<double>(begin: 1.9, end: 2).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    secondAnimation = Tween<double>(begin: 1.8, end: 2).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    thirdAnimation = Tween<double>(begin: 1.8, end: 2).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(begin: 1.9, end: 2).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    Timer(Duration(seconds: 2), () {
      firstController.forward();
    });

    Timer(Duration(milliseconds: 1600), () {
      secondController.forward();
    });

    Timer(Duration(milliseconds: 800), () {
      thirdController.forward();
    });

    fourthController.forward();
  }

  Timer? countdownTimer;
  Duration duration1 = Duration(minutes: 0);
  Duration duration2 = Duration(minutes: 0);

  void startTimer() {
    dataBuMe[0].second = '00';
    dataBuMe[0].minus = '00';
    dataBuMe[1].second = '00';
    dataBuMe[1].minus = '00';
    dataBuMe[0].isPlaying = false;
    dataBuMe[1].isPlaying = false;
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final addSecond1 = 1;
    final addSecond2 = 1;

    if (dataBuMe[1].isPlaying == true) {
      final seconds1 = duration1.inSeconds + addSecond1;
      duration1 = Duration(seconds: seconds1);
      duration2 = Duration(seconds: 00);
    } else if (dataBuMe[0].isPlaying == true) {
      final seconds2 = duration2.inSeconds + addSecond2;
      duration2 = Duration(seconds: seconds2);
    }
    if (dataBuMe[0].isPlaying == false) {
      dataBuMe[0].second = dataBuMe[0].second;
      dataBuMe[0].minus = dataBuMe[0].minus;
    } else if (dataBuMe[1].isPlaying == false) {
      dataBuMe[1].second = dataBuMe[1].second;
      dataBuMe[1].minus = dataBuMe[1].minus;
    }
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.bottomCenter,
      scale: 1.7,
      child: Container(
        height: widget.ml,
        width: 58,
        child: CustomPaint(
          painter: MyPainter(
            firstAnimation.value,
            secondAnimation.value,
            thirdAnimation.value,
            fourthAnimation.value,
            widget.colors[widget.widgetId],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;
  final Color colorAnimation;

  MyPainter(
    this.firstValue,
    this.secondValue,
    this.thirdValue,
    this.fourthValue,
    this.colorAnimation,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = colorAnimation
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(size.width * 0.4, size.height / secondValue, size.width * 0.7,
          size.height / thirdValue, size.width, size.height / fourthValue)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
