// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/enum/checkbox_enum.dart';
import 'package:flutter_ovumb_app_version1/data/model_nhatky.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/nhatky/confirm_button.dart'; // {}

class CheckListScreen extends StatefulWidget {
  final int titleId;
  const CheckListScreen({
    Key? key,
    required this.titleId,
  }) : super(key: key);

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  @override
  void initState() {
    super.initState();
  }

  void isCheck() {}

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //List<String> content = [];
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
          child: ListView(
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
                height: sizeHeight / 3,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  //itemCount: 2,
                  itemCount: answer[widget.titleId].detailTitle.length,
                  //answer[widget.titleId].detailTitle[widget.widgetId],
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
                        child: CheckboxListTile(
                          // activeColor: Colors.blue,
                          activeColor: Palette.textColor,
                          value: answer[widget.titleId].checkbox[index],
                          title: Text(
                            answer[widget.titleId].detailTitle[index],
                            style: const TextStyle(color: Palette.text),
                          ),
                          onChanged: (value) {
                            setState(() {
                              answer[widget.titleId].checkbox[index] =
                                  !answer[widget.titleId].checkbox[index];
                              if (answer[widget.titleId].checkbox[index] ==
                                  true) {
                                if (question[widget.titleId].checkboxType ==
                                    CheckboxEnum.special) {
                                  if (index == 0) {
                                    question[widget.titleId].subtitle.clear();
                                    answer[widget.titleId].checkbox.setAll(
                                        1,
                                        List.generate(
                                            answer[widget.titleId]
                                                    .detailTitle
                                                    .length -
                                                1,
                                            (i) => false));
                                  } else {
                                    answer[widget.titleId].checkbox[0] = false;
                                    question[widget.titleId].subtitle.remove(
                                        answer[widget.titleId].detailTitle[0]);
                                  }
                                  question[widget.titleId].subtitle.add(
                                      answer[widget.titleId]
                                          .detailTitle[index]);
                                } else {
                                  question[widget.titleId].subtitle.add(
                                      answer[widget.titleId]
                                          .detailTitle[index]);
                                }
                              } else {
                                question[widget.titleId].subtitle.remove(
                                    answer[widget.titleId].detailTitle[index]);
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //dao nguoc vi tri cua title va checkbox
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ConfirmButton(
                  text: 'Xác nhận',
                  fixedSize:
                      MaterialStatePropertyAll(Size(screenSize.width, 50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
