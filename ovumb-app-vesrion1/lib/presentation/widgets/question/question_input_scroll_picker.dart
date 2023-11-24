// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/model_nhatky.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../utils/color.dart';
import '../../utils/primary_font.dart';

//Nút input thường
// ignore: must_be_immutable
class QuestionInputScrollPicker extends StatefulWidget {
  final String text;
  TextEditingController controller;
  final int beginNumber;
  final int endNumber;
  final String subtext;
  final int? initialItem;
  QuestionInputScrollPicker({
    Key? key,
    required this.text,
    required this.controller,
    required this.beginNumber,
    required this.endNumber,
    required this.subtext,
    this.initialItem,
  }) : super(key: key);

  @override
  State<QuestionInputScrollPicker> createState() =>
      _QuestionInputScrollPickerState();
}

class _QuestionInputScrollPickerState extends State<QuestionInputScrollPicker> {
  late FocusNode _focus;

  @override
  void initState() {
    _focus = FocusNode();
    _focus.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Column(
        children: [
          Expanded(
            //fit: FlexFit.tight,
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TitleText(
                text: widget.text,
                fontWeight: FontWeight.w600,
                size: 18,
                color: grey600,
              ),
            ),
          ),
          Expanded(
            //fit: FlexFit.tight,
            flex: 1,
            child: InkWell(
              onTap: () {
                if (widget.controller.text.isEmpty) {
                  setState(() {
                    widget.controller.text = widget.beginNumber.toString();
                  });
                }
                showModalBottomSheet(
                  backgroundColor: whiteColor,
                  //barrierColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: TextScaler.linear(1)),
                      child: ScrollPicker(
                        itemSelected: widget.controller,
                        beginNumber: widget.beginNumber,
                        endNumber: widget.endNumber - widget.beginNumber,
                        subtext: widget.subtext,
                        initialItem: 0,
                      ),
                    );
                  },
                );
              },
              child: TextFormField(
                enabled: false,
                controller: widget.controller,
                keyboardType: TextInputType.number,
                //controller: widget.controller,
                cursorColor: rose300,
                focusNode: _focus,
                style: PrimaryFont.medium(16, FontWeight.w500).copyWith(
                  color: _focus.hasFocus ? rose300 : grey300,
                ),
                decoration: InputDecoration(
                  focusColor: rose400,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 35),
                  fillColor: _focus.hasFocus ? rose25 : grey25,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(38),
                    borderSide: const BorderSide(
                      width: 0,
                      color: grey25,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(38),
                    borderSide: const BorderSide(
                      color: rose300,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(38),
                    borderSide: const BorderSide(
                      color: grey300,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ScrollPicker extends StatefulWidget {
  TextEditingController itemSelected;
  int beginNumber;
  int endNumber;
  String subtext;
  int initialItem;
  ScrollPicker({
    Key? key,
    required this.itemSelected,
    required this.beginNumber,
    required this.endNumber,
    required this.subtext,
    required this.initialItem,
  }) : super(key: key);

  @override
  State<ScrollPicker> createState() => _ScrollPickerState();
}

class _ScrollPickerState extends State<ScrollPicker> {
  late FixedExtentScrollController controller;
  @override
  void initState() {
    if (widget.itemSelected.text.isEmpty) {
      controller = FixedExtentScrollController(initialItem: widget.initialItem);
    } else {
      controller = FixedExtentScrollController(
          initialItem:
              int.parse(widget.itemSelected.text) - widget.beginNumber);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double heightModal = screenSize.height * 0.46;
    return Container(
      height: heightModal,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: screenSize.width * 0.4,
                    decoration: BoxDecoration(
                      color: grey400,
                      borderRadius: BorderRadius.circular(32),
                      // color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    //color: rose50,
                    width: screenSize.width,
                    height: 10,
                  ),
                ),
                SizedBox(
                  height: heightModal * 0.6,
                  child: ScrollConfiguration(
                    behavior: ScrollBehavior(),
                    child: ListWheelScrollView(
                      overAndUnderCenterOpacity: 0.1,
                      controller: controller,
                      physics: FixedExtentScrollPhysics(),
                      itemExtent: 50, // chiều cao của mỗi item trong danh sách
                      children: List.generate(widget.endNumber, (index) {
                        return DayPickerIntNumber(
                          intNumber: (index + widget.beginNumber),
                          subtext: widget.subtext,
                        );
                      }),

                      onSelectedItemChanged: (value) {
                        setState(() {
                          widget.itemSelected.text =
                              (value + widget.beginNumber).toString();
                          controller = FixedExtentScrollController(
                              initialItem: int.parse(widget.itemSelected.text));
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 24, vertical: screenSize.height * 0.016),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        rose600,
                        rose400,
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
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    // overlayColor: const MaterialStatePropertyAll(
                    //     Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38),
                    )),
                    elevation: MaterialStateProperty.all(0),
                    fixedSize: MaterialStateProperty.all(
                      Size(
                        screenSize.width * 0.9,
                        screenSize.height * 0.065,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      PrimaryFont.semibold(16, FontWeight.w600)
                          .copyWith(color: greyText),
                    ),
                  ),
                  child: Text(
                    'Xác nhận',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
