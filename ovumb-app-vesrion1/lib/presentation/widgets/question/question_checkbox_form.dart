import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/main_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

import '../../utils/color.dart';

// ignore: must_be_immutable
class QuestionCheckboxForm extends StatefulWidget {
  final List<String> listOption;
  final List<bool> listValue;
  String textTitle;
  QuestionCheckboxForm({
    super.key,
    required this.listOption,
    required this.listValue,
    required this.textTitle,
  });

  @override
  State<QuestionCheckboxForm> createState() => _QuestionCheckboxFormState();
}

class _QuestionCheckboxFormState extends State<QuestionCheckboxForm> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: MainText(
                text: widget.textTitle,
                color: grey600,
                align: TextAlign.start,
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TitleText(
                  text: 'Hãy lựa chọn các đáp án bên dưới',
                  fontWeight: FontWeight.w400,
                  size: 18,
                  color: grey600,
                ),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.listOption.length,
                itemBuilder: (context, index) => Container(
                  height: 45,
                  color: Colors.white,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: rose300, disabledColor: grey300),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.all(0),
                      title: TitleText(
                        text: widget.listOption[index],
                        fontWeight: FontWeight.w400,
                        size: 18,
                        color: grey600,
                      ),
                      value: widget.listValue[index],
                      onChanged: (value) {
                        setState(() {
                          widget.listValue[index] = value!;
                        });
                      },
                      activeColor: rose300,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
