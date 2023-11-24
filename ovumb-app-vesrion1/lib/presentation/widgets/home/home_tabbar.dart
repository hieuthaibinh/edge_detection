// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

import '../../utils/color.dart';

//Tabbar của phầm home
class HomeTabbar extends StatefulWidget {
  final int index;
  final int phase;
  final ValueChanged<int> onChangedTab;
  const HomeTabbar({
    Key? key,
    required this.index,
    required this.phase,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  State<HomeTabbar> createState() => _HomeTabbarState();
}

class _HomeTabbarState extends State<HomeTabbar> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: CupertinoTabBar(
        height: 60,
        backgroundColor: whiteColor,
        border: Border(
          top: BorderSide(
            width: 3,
            color: grey200.withOpacity(0.4),
          ),
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.asset(
                widget.index == 0
                    ? 'assets/icons/home_active.png'
                    : 'assets/icons/home_unactive.png',
                scale: 2.8,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              widget.index == 1
                  ? 'assets/icons/chart_active.png'
                  : 'assets/icons/chart_unactive.png',
              scale: 2.8,
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              widget.index == 2
                  ? 'assets/icons/calendar_active.png'
                  : 'assets/icons/calendar_unactive.png',
              scale: 2.8,
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Image.asset(
                widget.index == 3
                    ? 'assets/icons/user_active.png'
                    : 'assets/icons/user_unactive.png',
                scale: 2.8,
              ),
            ),
          ),
        ],
        currentIndex: widget.index,
        onTap: (index) {
          if (widget.phase == 5) {
            final newIndex = getIndex(index);
            if (newIndex == 1) {
              showToast(context, 'Tính năng không phù hợp với độ tuổi của bạn');
            } else {
              if (newIndex == -1) {
                return;
              } else {
                widget.onChangedTab(newIndex);
              }
            }
          } else {
            final newIndex = getIndex(index);
            if (newIndex == -1) {
              return;
            } else {
              widget.onChangedTab(newIndex);
            }
          }
        },
      ),
    );
  }

  int getIndex(int index) {
    if (index == 2) return -1;
    final newIndex = index > 2 ? index - 1 : index;
    return newIndex;
  }
}
