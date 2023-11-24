import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class SampleButton extends StatelessWidget {
  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;
  final String text;
  final String routeName;
  final String? pushNamedAndRemoveUntil;
  final bool? disable;
  const SampleButton({
    super.key,
    required this.text,
    this.fixedSize,
    this.textStyle,
    required this.routeName,
    this.pushNamedAndRemoveUntil,
    this.disable,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              rose600.withOpacity(disable == null ? 1 : 0.6),
              rose400.withOpacity(disable == null ? 1 : 0.6),
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
          // nếu disable có giá trị thì button không hoạt động
          // nếu button hoạt động check xem có push có remove không
          disable == null
              ? pushNamedAndRemoveUntil == null
                  ? Navigator.pushNamed(context, routeName)
                  : Navigator.pushNamedAndRemoveUntil(
                      context, routeName, (route) => false)
              : null;
        },
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          fixedSize: fixedSize,
          //foregroundColor: MaterialStateProperty.all(roseTitleText),
          textStyle: textStyle,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
