import 'package:flutter/cupertino.dart';

class Palette {
  static const primaryColorRose600 = Color(0xFFE31B54);
   static const primaryColorRose500 = Color(0xFFf63d68);
  static const primaryColorRose400 = Color(0xFFFD6F8E);
  static const Color textColor = Color(0xfffd6f8e);
  static const Color title = Color(0xfffd6f8e);
  static const Color text = Color(0xff344054);
  static const Color pageView = Color(0xffffe4e8);
  static LinearGradient button = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xfff63d68),
      Color(0xfffd6f8e),
    ],
  );
  static LinearGradient background = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xfff63d68),
      Color(0xfffea3b4),
    ],
  );
  static const LinearGradient buttonColor = LinearGradient(
    colors: [
      Color(0xffe31b54),
      Color(0xfffea3b4),
    ],
  );
}
