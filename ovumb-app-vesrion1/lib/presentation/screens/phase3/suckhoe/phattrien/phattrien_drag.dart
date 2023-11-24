// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_phattrien.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

class PhattrienDrag extends StatefulWidget {
  final DataPhatTrien dataPhatTrien;
  final Color activeColor;
  final Color normalColor;
  final TextEditingController controller;
  StreamController swapButtonStream;
   PhattrienDrag({
    Key? key,
    required this.dataPhatTrien,
    required this.activeColor,
    required this.normalColor,
    required this.controller,
    required this.swapButtonStream,
  }) : super(key: key);

  @override
  State<PhattrienDrag> createState() => _PhattrienDragState();
}

class _PhattrienDragState extends State<PhattrienDrag> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 100,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.1,
              blurRadius: 10,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5),
                Image.asset(
                  widget.dataPhatTrien.image,
                  scale: 3,
                ),
                Container(
                  height: 100,
                  width: size.width * 0.635,
                  child: HorizontalPicker(
                    minValue: widget.dataPhatTrien.minNumber,
                    maxValue: widget.dataPhatTrien.maxNumber,
                    divisions: 100,
                    showCursor: false,
                    backgroundColor: Colors.white,
                    activeItemTextColor: widget.activeColor,
                    passiveItemsTextColor: widget.normalColor,
                    onChanged: (value) {
                      widget.controller.text = value.toString();
                      widget.swapButtonStream.add(true);
                    },
                    height: 100,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 240,
              top: 6,
              child: Image.asset(
                'assets/images/down.png',
                scale: 3,
                color: widget.activeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
