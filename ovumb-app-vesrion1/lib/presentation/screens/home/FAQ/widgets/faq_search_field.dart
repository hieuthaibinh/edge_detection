import 'package:flutter/material.dart';
import '../../../../utils/color.dart';
import '../../../../utils/primary_font.dart';

//Nút search của màn hình FAQ
class FAQSearchField extends StatefulWidget {
  const FAQSearchField({
    super.key,
  });

  @override
  State<FAQSearchField> createState() => _FAQSearchFieldState();
}

class _FAQSearchFieldState extends State<FAQSearchField> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: TextField(
        cursorColor: grey500,
        style: PrimaryFont.medium(16, FontWeight.w500).copyWith(
          color: grey500,
        ),
        decoration: InputDecoration(
          focusColor: rose400,
          prefixIcon: Image.asset('assets/icons/search_icon.png'),
          prefixIconColor: grey400,
          hintText: 'Tìm kiếm',
          hintStyle: PrimaryFont.medium(16, FontWeight.w500).copyWith(
            color: grey400,
          ),
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
