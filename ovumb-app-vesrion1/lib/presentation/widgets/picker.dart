// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/model_nhatky.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/nhatky/confirm_button.dart';

class Picker extends StatefulWidget {
  final int titleId;
  TextEditingController controller1;
  TextEditingController controller2;
  Picker({
    Key? key,
    required this.titleId,
    required this.controller1,
    required this.controller2,
  }) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  late FixedExtentScrollController _controller;
  late FixedExtentScrollController _controllerDouble;
  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
    _controllerDouble = FixedExtentScrollController();

    if (widget.controller1.text.isEmpty) {
      _controller = FixedExtentScrollController(initialItem: 0);
    } else {
      _controller = FixedExtentScrollController(
          initialItem: int.parse(widget.controller1.text) - 35);
    }

    if (widget.controller2.text.isEmpty) {
      _controllerDouble = FixedExtentScrollController(initialItem: 0);
    } else {
      _controllerDouble = FixedExtentScrollController(
          initialItem: int.parse(widget.controller2.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: sizeHeight / 1.7,
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
                height: sizeHeight / 13,
                child: Text(
                  question[widget.titleId].title.toString(),
                  style: const TextStyle(
                    color: Palette.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(color: Palette.textColor),
              //phần cuộn chọn
              Stack(
                children: [
                  Positioned(
                    bottom: sizeHeight / 3 / 2.2,
                    child: Container(
                      color: Palette.textColor.withOpacity(0.2),
                      width: sizeWidth,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    //color: Colors.greenAccent,
                    height: sizeHeight / 3.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //////////////////////////////////////////////////
                        //intNumber
                        SizedBox(
                          width: 70,
                          child: ListWheelScrollView.useDelegate(
                              controller: _controller,
                              itemExtent: 50,
                              //perspective: 0.005,
                              diameterRatio: 1.2,
                              physics: const FixedExtentScrollPhysics(),
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 6,
                                builder: (context, index) {
                                  return DetailsPickerIntNumber(
                                    intNumber: index,
                                  );
                                },
                              ),
                              onSelectedItemChanged: (value1) {
                                setState(() {
                                  int res = value1 + 35;
                                  widget.controller1.text = res.toString();
                                  question[widget.titleId]
                                      .subtitle
                                      .add(res.toString());
                                });
                              }),
                        ),
                        const SizedBox(width: 50),
                        SizedBox(
                          width: 70,
                          child: ListWheelScrollView.useDelegate(
                              controller: _controllerDouble,
                              itemExtent: 50,
                              perspective: 0.005,
                              diameterRatio: 1.2,
                              physics: const FixedExtentScrollPhysics(),
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 10,
                                builder: (context, index) {
                                  return DetailsPickerDoubleNumber(
                                    doubleNumber: index,
                                  );
                                },
                              ),
                              onSelectedItemChanged: (value) {
                                //$celsius C
                                setState(() {
                                  widget.controller2.text = value.toString();
                                  question[widget.titleId]
                                      .subtitle
                                      .add(value.toString());
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    height: 70,
                    child: Container(
                      height: sizeHeight * 0.075,
                      width: sizeWidth,
                      //color: rose600.withOpacity(0.1),
                      decoration: BoxDecoration(
                        // color: Colors.white
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(1),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    height: 100,
                    child: Container(
                      height: sizeHeight * 0.075,
                      width: sizeWidth,
                      //color: rose600.withOpacity(0.1),
                      decoration: BoxDecoration(
                        //color: Colors.red
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white.withOpacity(1),
                            Colors.white.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ConfirmButton(
                  text: 'Xác nhận',
                  fixedSize: MaterialStatePropertyAll(Size(sizeWidth, 50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
