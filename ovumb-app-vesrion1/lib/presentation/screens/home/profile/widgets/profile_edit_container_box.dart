// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';

class ProfileEditContainerBox extends StatefulWidget {
  TextEditingController controller;
  ProfileEditContainerBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileEditContainerBox> createState() =>
      _ProfileEditContainerBoxState();
}

class _ProfileEditContainerBoxState extends State<ProfileEditContainerBox> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: TextField(
        controller: widget.controller,
        cursorColor: grey500,
        style: PrimaryFont.medium(16, FontWeight.w500).copyWith(
          color: grey500,
        ),
        decoration: InputDecoration(
          focusColor: rose400,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 35),
          fillColor: grey100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 0,
              color: grey25,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: grey300,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
