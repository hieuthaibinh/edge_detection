import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../utils/color.dart';
import '../../utils/primary_font.dart';
import '../../utils/question.dart';

//Nút input có dropdown để chọn
class QuestionInputDropdown extends StatefulWidget {
  final String text;
  const QuestionInputDropdown({
    super.key,
    required this.text,
  });

  @override
  State<QuestionInputDropdown> createState() => _QuestionInputDropdownState();
}

class _QuestionInputDropdownState extends State<QuestionInputDropdown> {
  late FocusNode _focus;

  @override
  void initState() {
    _focus = FocusNode();
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
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: ButtonTheme(
                padding: EdgeInsets.zero,
                alignedDropdown: true,
                child: DropdownButtonFormField2<String>(
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusNode: _focus,
                  focusColor: Colors.transparent,
                  icon: Icon(
                    _focus.hasFocus
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: _focus.hasFocus ? rose300 : grey300,
                  ),
                  isExpanded: true,
                  dropdownMaxHeight: 200,
                  iconSize: 30,
                  buttonHeight: 50,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                  dropdownOverButton: false,
                  items: listDateOfBirth
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: PrimaryFont.medium(16, FontWeight.w500)
                                .copyWith(
                              color: _focus.hasFocus ? rose300 : grey300,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (item) => setState(() {
                    selectedDateOfBirth = item;
                  }),
                  onMenuStateChange: (isOpen) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    focusColor: rose400,
                    filled: true,
                    contentPadding: EdgeInsets.zero,
                    fillColor: _focus.hasFocus ? rose25 : grey25,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(38),
                      borderSide: const BorderSide(
                        color: rose300,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
