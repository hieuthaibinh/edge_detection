import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/milk1.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class MilkBottle extends StatefulWidget {
  int widgetId;
  List<Color> colors;
  List<Color> suaColors;
  List<String> images;
  List<DataBuBinh> dataBuBinh;

  MilkBottle({
    Key? key,
    required this.widgetId,
    required this.colors,
    required this.suaColors,
    required this.images,
    required this.dataBuBinh,
  }) : super(key: key);

  @override
  State<MilkBottle> createState() => _MilkBottleState();
}

class _MilkBottleState extends State<MilkBottle> {
  double ml = 200;

  final _numberLimit = 600;
  bool _isNumberValid = true;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.dataBuBinh[widget.widgetId].controller.addListener(() {
      final enteredNumber =
          int.tryParse(widget.dataBuBinh[widget.widgetId].controller.text);
      if (enteredNumber != null && enteredNumber > _numberLimit) {
        setState(() {
          _isNumberValid = false;
        });
      } else {
        setState(() {
          _isNumberValid = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        color: Colors.transparent,
        height: size.height,
        width: size.width,
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            // hình sóng
            Positioned(
              bottom: 5,
              top: 8,
              left: size.width * 0.36,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.bottomCenter,
                child: Milk1(
                  ml: widget.dataBuBinh[widget.widgetId].value,
                  widgetId: widget.widgetId,
                  colors: widget.suaColors,
                ),
              ),
            ),
            // hình cái bình
            Positioned(
              bottom: 5,
              top: 5,
              left: size.width * 0.26,
              child: Image.asset(
                widget.widgetId == 1 ? widget.images[0] : widget.images[1],
              ),
            ),
            // mũi tên chỉ vạch
            Positioned(
              left: size.width * 0.24,
              child: Container(
                height: 155,
                width: 30,
                margin: EdgeInsets.only(top: 78),
                alignment: Alignment.bottomRight,
                color: Colors.transparent,
                child: FlutterSlider(
                    axis: Axis.vertical,
                    tooltip: FlutterSliderTooltip(
                      disabled: true,
                    ),
                    touchSize: 5,
                    rtl: true,
                    values: [widget.dataBuBinh[widget.widgetId].value],
                    max: 240, // giá trị của ml, giá trị của sóng là 200
                    min: 0,
                    handlerHeight: 20,
                    handlerWidth: 20,
                    handler: FlutterSliderHandler(
                      child: Material(
                        color: Colors.transparent,
                        type: MaterialType.canvas,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Image.asset(
                            'assets/images/down.png',
                            color: widget.colors[widget.widgetId],
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    foregroundDecoration:
                        BoxDecoration(color: Colors.transparent),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 30,
                      inactiveTrackBarHeight: 30,
                      activeTrackBar: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      inactiveTrackBar: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      widget.dataBuBinh[widget.widgetId].value = lowerValue;
                      setState(() {});
                      widget.dataBuBinh[widget.widgetId].controller.text =
                          (lowerValue * 2.5).toInt().toString();
                    }),
              ),
            ),
            // chữ ml

            Positioned(
              top: 130,
              left: size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: TextFormField(
                          focusNode: _focusNode,
                          onTapOutside: (event) {
                            _focusNode.unfocus();
                          },
                          controller:
                              widget.dataBuBinh[widget.widgetId].controller,
                          decoration: InputDecoration(),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter
                                .digitsOnly // Chỉ cho phép nhập số
                          ],
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              widget.dataBuBinh[widget.widgetId].value =
                                  double.parse(value) / 2.5;
                              setState(() {});
                            }
                          },
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 40,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TitleText(
                            text: 'ml',
                            fontWeight: FontWeight.w600,
                            size: 16,
                            color: widget.colors[widget.widgetId],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  _isNumberValid
                      ? SizedBox()
                      : TitleText(
                          text: 'ml quá lớn',
                          fontWeight: FontWeight.w500,
                          size: 10,
                          color: rose700,
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
