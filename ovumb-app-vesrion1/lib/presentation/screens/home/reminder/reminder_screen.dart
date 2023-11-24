import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/reminder/widgets/reminder_container_box.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ReminderScreen extends StatefulWidget {
  static const String routeName = 'reminder-screen';
  const ReminderScreen({super.key});
  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: TitleText(
              text: 'Nhắc Nhở Quan Trọng',
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
              onPressed: () => Scaffold.of(context).openDrawer(),
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
            child: Stack(
              children: [
                ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TitleText(
                            text: 'Hôm nay',
                            fontWeight: FontWeight.w700,
                            size: 16,
                            color: grey600,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TitleText(
                            text: 'Hôm qua',
                            fontWeight: FontWeight.w700,
                            size: 16,
                            color: grey600,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                          ReminderContainerBox(
                            leftIcon: 'assets/images/ellipse_dot.png',
                            title: 'Test lại qua thử rụng trứng',
                            subTitle: 'Bạn hãy test lại vào lúc 16:00',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -1,
                  height: 50,
                  child: Container(
                    height: size.height * 0.075,
                    width: size.width,
                    //color: rose600.withOpacity(0.1),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          whiteColor.withOpacity(1),
                          whiteColor.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
