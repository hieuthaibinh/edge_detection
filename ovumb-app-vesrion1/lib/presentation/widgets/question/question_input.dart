// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../utils/color.dart';
import '../../utils/primary_font.dart';

//Nút input thường
// ignore: must_be_immutable
class QuestionInput extends StatefulWidget {
  final String text;
  TextEditingController controller;
  QuestionInput({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  State<QuestionInput> createState() => _QuestionInputState();
}

class _QuestionInputState extends State<QuestionInput> {
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
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Align(
              alignment: Alignment.topLeft,
              child: TitleText(
                text: widget.text,
                fontWeight: FontWeight.w600,
                size: 18,
                color: grey600,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              controller: widget.controller,
              cursorColor: rose300,
              focusNode: _focus,
              style: PrimaryFont.medium(16, FontWeight.w500).copyWith(
                color: _focus.hasFocus ? rose300 : grey300,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập giá trị';
                }
                final n = num.tryParse(value);
                if (n == null) {
                  return 'Giá trị phải là số';
                }
                return null;
              },
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
          )
        ],
      ),
    );
  }
}
