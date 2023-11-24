import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/main_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// ignore: must_be_immutable
class QuestionRadioForm extends StatefulWidget {
  final List<String> listOption;
  String _oneValue;
  String textTitle;
  QuestionRadioForm({
    super.key,
    required this.listOption,
    required String oneValue,
    required this.textTitle,
  }) : _oneValue = oneValue;

  @override
  State<QuestionRadioForm> createState() => _QuestionRadioFormState();
}

class _QuestionRadioFormState extends State<QuestionRadioForm> {
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
                  text: 'Hãy lựa chọn 1 đáp án bên dưới',
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
                  padding: EdgeInsets.zero,
                  height: 38,
                  color: Colors.white,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: rose300, disabledColor: grey300),
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: TitleText(
                        text: widget.listOption[index],
                        fontWeight: FontWeight.w400,
                        size: 18,
                        color: grey600,
                      ),
                      value: widget.listOption[index],
                      groupValue: widget._oneValue,
                      onChanged: (value) {
                        setState(() {
                          widget._oneValue = value.toString();
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
