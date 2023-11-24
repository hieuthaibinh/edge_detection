// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_nhatky.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/milk.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class BuMePicker extends StatefulWidget {
  BuMePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<BuMePicker> createState() => _BuMePickerState();
}

class _BuMePickerState extends State<BuMePicker> {
  late FixedExtentScrollController _leftController;
  late FixedExtentScrollController _rightController;
  final List<String> items = [
    'Ngực trái',
    'Ngực phải',
  ];

  int isLeft = 0;
  List<int> left = [0, 0];
  List<int> right = [0, 0];
  List<bool> _checkRd = [true, false];

  @override
  void initState() {
    super.initState();
    _leftController = FixedExtentScrollController();
    _rightController = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.transparent),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                'Chỉnh sửa thời gian Bú Mẹ (phút:giây)',
                style: const TextStyle(
                  color: Palette.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(color: Palette.textColor),
            //phần cuộn chọn
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _checkRd[0] = true;
                            _checkRd[1] = false;
                            setState(() {});
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        _checkRd[0]
                                            ? 'assets/icons/radio_check.png'
                                            : 'assets/icons/radio_uncheck.png',
                                        scale: 3.5,
                                      ),
                                      const SizedBox(width: 6),
                                      TitleText(
                                        text: 'Trái ',
                                        fontWeight: FontWeight.bold,
                                        size: 18,
                                        color: Palette.textColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  child: TitleText(
                                    text: ' (${left[0]}:${left[1]})',
                                    fontWeight: FontWeight.w400,
                                    size: 18,
                                    color: Palette.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        GestureDetector(
                          onTap: () {
                            _checkRd[1] = true;
                            _checkRd[0] = false;
                            setState(() {});
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        _checkRd[1]
                                            ? 'assets/icons/radio_check.png'
                                            : 'assets/icons/radio_uncheck.png',
                                        scale: 3.5,
                                      ),
                                      const SizedBox(width: 6),
                                      TitleText(
                                        text: 'Phải',
                                        fontWeight: FontWeight.bold,
                                        size: 18,
                                        color: Palette.textColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 75,
                                  child: TitleText(
                                    text: ' (${right[0]}:${right[1]})',
                                    fontWeight: FontWeight.w400,
                                    size: 18,
                                    color: Palette.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 180,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                child: ListWheelScrollView.useDelegate(
                                  controller: _leftController,
                                  itemExtent: 50,
                                  //perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 60,
                                    builder: (context, index) {
                                      return DetailsPickerBuMeNumber(
                                        intNumber: index,
                                      );
                                    },
                                  ),
                                  onSelectedItemChanged: (value) {
                                    setState(() {
                                      if (_checkRd[0]) {
                                        left[0] = value;
                                      } else {
                                        right[0] = value;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 5,
                                height: 55,
                                child: TitleText(
                                  text: ':',
                                  fontWeight: FontWeight.bold,
                                  size: 21,
                                  color: Palette.textColor,
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                child: ListWheelScrollView.useDelegate(
                                    controller: _rightController,
                                    itemExtent: 50,
                                    perspective: 0.005,
                                    diameterRatio: 1.2,
                                    physics: const FixedExtentScrollPhysics(),
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: 60,
                                      builder: (context, index) {
                                        return DetailsPickerBuMeNumber(
                                          intNumber: index,
                                        );
                                      },
                                    ),
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        if (_checkRd[0]) {
                                          left[1] = value;
                                        } else {
                                          right[1] = value;
                                        }
                                      });
                                    }),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            height: 50,
                            child: Container(
                              height: 100,
                              width: sizeWidth,
                              //color: rose600.withOpacity(0.1),
                              decoration: BoxDecoration(
                                // color: Colors.white
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(1),
                                    Colors.white.withOpacity(0.8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -1,
                            height: 80,
                            child: Container(
                              height: 126,
                              width: sizeWidth,
                              //color: rose600.withOpacity(0.1),
                              decoration: BoxDecoration(
                                //color: Colors.red
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.white.withOpacity(1),
                                    Colors.white.withOpacity(0.8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        rose600,
                        rose500,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(38),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: ElevatedButton(
                  onPressed: () {
                    if (left[0] != 0 || left[1] != 0) {
                      milkLeft = left[0] * 60 + left[1];
                    }
                    if (right[0] != 0 || right[1] != 0) {
                      milkRight = right[0] * 60 + right[1];
                    }
                    left[0] = 0;
                    left[1] = 0;
                    right[0] = 0;
                    right[1] = 0;

                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                    fixedSize: MaterialStatePropertyAll(Size(sizeWidth, 50)),
                    //foregroundColor: MaterialStateProperty.all(roseTitleText),
                  ),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
