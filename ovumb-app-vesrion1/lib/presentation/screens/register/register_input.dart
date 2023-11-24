// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class RegisterInput extends StatefulWidget {
  String name;
  String iconUrl;
  TextEditingController controller;
  bool isClick;
  bool isPassword;
  bool? enabled;
  RegisterInput({
    Key? key,
    required this.name,
    required this.iconUrl,
    required this.controller,
    required this.isClick,
    required this.isPassword,
    this.enabled,
  }) : super(key: key);

  @override
  State<RegisterInput> createState() => _RegisterInputState();
}

class _RegisterInputState extends State<RegisterInput> {
  late FocusNode _focus;
  late bool isShow;

  @override
  void initState() {
    _focus = FocusNode();
    _focus.addListener(() {
      setState(() {});
    });
    isShow = widget.isPassword;
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: grey100,
            blurRadius: 10,
            spreadRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        enabled: widget.enabled ?? true,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        focusNode: _focus,
        cursorColor: rose400,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ).copyWith(
          color: _focus.hasFocus ? rose400 : grey400,
        ),
        onTapOutside: (event) {
          _focus.unfocus();
        },
        obscureText: isShow,
        decoration: InputDecoration(
          focusColor: rose400,
          prefixIcon: Image.asset(
            widget.iconUrl,
            scale: 3,
            color: _focus.hasFocus ? rose400 : grey400,
          ),
          prefixIconColor: grey400,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: _toggle,
                  child: Image.asset(
                    isShow
                        ? 'assets/icons/eye_icon.png'
                        : 'assets/icons/eye_off_icon.png',
                    color: _focus.hasFocus ? rose400 : grey400,
                    scale: 3,
                  ),
                )
              : const SizedBox(),
          hintText: widget.name,
          hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ).copyWith(
            color: grey400,
          ),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 35, top: 20, bottom: 20),
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
                    color: rose400,
                  )
                : BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
