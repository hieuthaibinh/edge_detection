// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';

// cũng là input filed nhưng là border hình vuông
// ignore: must_be_immutable
class InputFieldRectangle extends StatefulWidget {
  String name;
  String iconUrl;
  TextEditingController controller;
  bool isClick;

  InputFieldRectangle({
    Key? key,
    required this.name,
    required this.iconUrl,
    required this.controller,
    required this.isClick,
  }) : super(key: key);

  @override
  State<InputFieldRectangle> createState() => _InputFieldRectangleState();
}

class _InputFieldRectangleState extends State<InputFieldRectangle> {
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
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: grey100,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          controller: widget.controller,
          focusNode: _focus,
          cursorColor: rose500,
          style: PrimaryFont.medium(16, FontWeight.w500).copyWith(
            color: _focus.hasFocus ? rose400 : grey400,
          ),
          decoration: InputDecoration(
            focusColor: rose400,
            prefixIcon: Image.asset(
              widget.iconUrl,
              color: _focus.hasFocus ? rose400 : grey400,
              scale: 3,
            ),
            prefixIconColor: grey400,
            hintText: widget.name,
            hintStyle: PrimaryFont.medium(16, FontWeight.w500).copyWith(
              color: grey400,
            ),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            fillColor: whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                width: 0,
                color: whiteColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: widget.controller.text.isEmpty && widget.isClick
                  ? const BorderSide(
                      width: 1,
                      color: rose500,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
