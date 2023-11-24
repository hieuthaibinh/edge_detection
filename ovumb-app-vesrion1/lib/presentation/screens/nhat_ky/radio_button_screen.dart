import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_nhatky.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';

class RadioButton extends StatefulWidget {
  final int titleId;
  const RadioButton({super.key, required this.titleId});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  var _value;

  @override
  void initState() {
    super.initState();
    setValue();
  }

  //đã có trong db rồi thì đặt là đã chọn
  void setValue() {
    // nếu đã có trong db rồi thì đặt giá trị khi hiện
    for (int i = 0; i < answer[widget.titleId].detailTitle.length; i++) {
      if (answer[widget.titleId].checkbox[i] == true) {
        _value = answer[widget.titleId].detailTitle[i];
        break;
      }
    }

    //nếu đã chọn nhưng chưa lưu vào db khi vào chọn lại thì đặt lại giá trị
    if (question[widget.titleId].subtitle.isNotEmpty) {
      _value = question[widget.titleId].subtitle.last;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final sizeHeight = MediaQuery.of(context).size.height;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: sizeHeight / 1.7, // chua responsive
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.transparent),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Stack(
            children: [
              Column(
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
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //    data[widget.titleId].title.toString(),
                  const Divider(color: Palette.textColor), // horizontal line
                  SizedBox(
                    height: sizeHeight / 3.1,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: answer[widget.titleId].detailTitle.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 35,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Palette.textColor,
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.5),
                                ),
                              ),
                            ), /////////////////////////
                            child: RadioListTile(
                              autofocus: true,
                              activeColor: Palette.textColor,
                              title: Text(
                                  answer[widget.titleId].detailTitle[index]),
                              groupValue: _value,
                              value: answer[widget.titleId].detailTitle[index],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                  question[widget.titleId].subtitle.add(
                                      answer[widget.titleId]
                                          .detailTitle[index]);
                                });
                              },
                            ),
                          ),
                        );
                      },
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
                          Navigator.of(context).pop();
                          if (widget.titleId == 0) {
                            if (question[widget.titleId].subtitle.last ==
                                'Không có') {
                              for (int i = 0; i < question.length; i++) {
                                question[i].subtitle.clear();
                                answer[i].checkbox.setAll(
                                    0,
                                    List.generate(answer[i].detailTitle.length,
                                        (i) => false));
                              }
                              setState(() {});
                            }
                          }
                        },
                        style: ButtonStyle(
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(38),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                          fixedSize: MaterialStatePropertyAll(
                              Size(screenSize.width, 50)),
                          //foregroundColor: MaterialStateProperty.all(roseTitleText),
                          //textStyle: textStyle,
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
            ],
          ),
        ),
      ),
    );
  }
}
