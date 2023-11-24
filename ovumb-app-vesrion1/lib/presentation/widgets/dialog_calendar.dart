// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_guide.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// hiển thị hướng dẫn trong phần lịch
Future<void> dialogBuilder(BuildContext context, Size screenSize) {
  return showDialog<void>(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            content: Container(
              height: 410,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff10182814),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: TitleText(
                              text: 'Chú thích lịch',
                              fontWeight: FontWeight.w600,
                              size: 16,
                              color: grey700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Image.asset(
                                'assets/icons/exit_dialog_icon.png',
                                scale: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[0].iconUrl,
                    text: calendarGuide[0].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[1].iconUrl,
                    text: calendarGuide[1].text,
                  ),
                  Divider(
                    height: 5,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[6].iconUrl,
                    text: calendarGuide[6].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[7].iconUrl,
                    text: calendarGuide[7].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[8].iconUrl,
                    text: calendarGuide[8].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[9].iconUrl,
                    text: calendarGuide[9].text,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

// hiển thị hướng dẫn trong phần lịch
Future<void> dialogBuilder1(BuildContext context, Size screenSize) {
  return showDialog<void>(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            content: Container(
              height: 410,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff10182814),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: TitleText(
                              text: 'Chú thích lịch',
                              fontWeight: FontWeight.w600,
                              size: 16,
                              color: grey700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Image.asset(
                                'assets/icons/exit_dialog_icon.png',
                                scale: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[0].iconUrl,
                    text: calendarGuide[0].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[1].iconUrl,
                    text: calendarGuide[1].text,
                  ),
                  Divider(
                    height: 5,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[2].iconUrl,
                    text: calendarGuide[2].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[3].iconUrl,
                    text: calendarGuide[3].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[4].iconUrl,
                    text: calendarGuide[4].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[5].iconUrl,
                    text: calendarGuide[5].text,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

// hiển thị hướng dẫn trong phần lịch
Future<void> dialogBuilder2(BuildContext context, Size screenSize) {
  return showDialog<void>(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            content: Container(
              height: 250,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff10182814),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: TitleText(
                              text: 'Chú thích lịch',
                              fontWeight: FontWeight.w600,
                              size: 16,
                              color: grey700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Image.asset(
                                'assets/icons/exit_dialog_icon.png',
                                scale: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[0].iconUrl,
                    text: calendarGuide[0].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[1].iconUrl,
                    text: calendarGuide[1].text,
                  ),
                  NoteItem(
                    iconUrl: calendarGuide[2].iconUrl,
                    text: calendarGuide[2].text,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class NoteItem extends StatelessWidget {
  final String iconUrl;
  final String text;
  const NoteItem({
    Key? key,
    required this.iconUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 24),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            scale: 2.8,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: grey700,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
