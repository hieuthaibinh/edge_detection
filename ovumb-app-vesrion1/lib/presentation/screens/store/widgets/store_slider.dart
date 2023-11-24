// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/store_slider.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/slider/slider_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class StoreSliderScreen extends StatefulWidget {
  final int timeNextSlide;
  final List<StoreSlider> sliders;
  const StoreSliderScreen({
    Key? key,
    required this.timeNextSlide,
    required this.sliders,
  }) : super(key: key);

  @override
  State<StoreSliderScreen> createState() => _StoreSliderScreenState();
}

class _StoreSliderScreenState extends State<StoreSliderScreen>
    with WidgetsBindingObserver {
  Timer? _timer;
  Timer? _timerTouchScreen;
  int _currentPage = 0;
  int _index = 0;
  bool _isTimerRunning = true;
  PageController _pageController = PageController(initialPage: 0);
  bool isUserScrolling = false;
  int count = 1;
  List<String> sliders = [];

  void _autoNextPage(int length) {
    if (_isTimerRunning) {
      _timer = Timer.periodic(Duration(seconds: widget.timeNextSlide), (timer) {
        setState(() {
          _currentPage = (_currentPage +
              1); // Thay đổi số 3 thành số trang bạn muốn hiển thị
          _index = _currentPage % widget.sliders.length;
          _pageController.animateToPage(_currentPage,
              duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
        });
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _isTimerRunning = false;
    setState(() {});
  }

  void _startTimer() {
    _isTimerRunning = true;
    setState(() {});
    _autoNextPage(5);
  }

  void _userTouch() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    if (_timerTouchScreen != null && _timerTouchScreen!.isActive) {
      _timerTouchScreen!.cancel();
    }
    _timerTouchScreen = Timer(Duration(seconds: widget.timeNextSlide), () {
      _startTimer();
    });
    _isTimerRunning = false;
    setState(() {});
  }

  void _initPage() {
    List<String> images = widget.sliders.map((e) => e.image).toList();
    for (int i = 0; i < 10000; i++) {
      sliders.addAll(images);
    }
  }

  @override
  void initState() {
    if (widget.sliders.isNotEmpty) {
      _initPage();
      _autoNextPage(5);
      WidgetsBinding.instance.addObserver(this);
      _pageController.addListener(() {
        if (_pageController.position.userScrollDirection ==
            ScrollDirection.idle) {
          setState(() {
            isUserScrolling = false;
          });
        } else {
          setState(() {
            isUserScrolling = true;
          });
        }
      });
      sliderRepository.streamSlider().listen((event) {
        if (event) {
          _startTimer();
        } else {
          _stopTimer();
        }
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_timerTouchScreen != null) {
      _timerTouchScreen!.cancel();
    }

    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Ứng dụng đã chuyển từ chế độ chạy ngầm trở lại chế độ hiển thị
      _startTimer();
    } else if (state == AppLifecycleState.paused) {
      // Ứng dụng đã chuyển sang chế độ chạy ngầm
      _stopTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 240,
      width: size.width,
      color: grey300,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: sliders.length,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: size.width,
                child: Image.asset(
                  sliders[index],
                  fit: BoxFit.cover,
                ),
              );
            },
            onPageChanged: (value) {
              if (isUserScrolling) {
                if (value > _currentPage) {
                  _currentPage++;
                } else {
                  _currentPage--;
                }
                _index = _currentPage % widget.sliders.length;
                _userTouch();
              }
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 8,
              width: 100,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.sliders.length,
                itemBuilder: (context, index) {
                  return buildIndicator(index == _index, size);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// indicator của chân trang question
Widget buildIndicator(bool isActive, Size size) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    curve: Curves.bounceInOut,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      color: isActive ? rose500 : Color(0xffF2F4F7),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
    ),
  );
}
