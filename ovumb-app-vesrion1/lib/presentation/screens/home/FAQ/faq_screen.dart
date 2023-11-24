// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/screens/home/FAQ/widgets/faq_dropdown.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/FAQ/widgets/faq_search_field.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';

import '../../../utils/faq.dart';
import '../../../utils/color.dart';
import '../../../widgets/title_text.dart';

class FAQScreen extends StatefulWidget {
  static const String routeName = 'faq-screen';
  const FAQScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool isShow = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: GlobalDrawer(
          size: screenSize,
          scaffoldKey: scaffoldKey,
        ),
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: TitleText(
              text: 'Câu Hỏi Thường Gặp',
              fontWeight: FontWeight.w600,
              size: 18,
              color: grey700,
            ),
          ),
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Image.asset(
                'assets/icons/back_button.png',
                scale: 3,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          actions: [
            IconButton(
              onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              icon: Image.asset(
                'assets/icons/right_home_icon.png',
                scale: 3,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FAQSearchField(),
                  const SizedBox(
                    height: 30,
                  ),
                  ScrollConfiguration(
                    behavior: ScrollBehavior(),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listQuestion.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              listCheck[index] = !listCheck[index];
                            });
                          },
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          child: FAQDropdown(
                            title: listQuestion[index],
                            subTitle: listAnswer[index],
                            isShow: listCheck[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
