// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HalfSampleButton extends StatelessWidget {
  final MaterialStateProperty<Size>? fixedSize;
  final TextStyle textStyle;
  final String text;
  final String routeName;
  final Color formColor;
  final Color toColor;
  const HalfSampleButton({
    Key? key,
    this.fixedSize,
    required this.textStyle,
    required this.text,
    required this.routeName,
    required this.formColor,
    required this.toColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              formColor,
              toColor,
            ],
          ),
          borderRadius: BorderRadius.circular(38),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          style: ButtonStyle(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            )),
            elevation: MaterialStateProperty.all(0),
            fixedSize: fixedSize,
            //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
          ),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
