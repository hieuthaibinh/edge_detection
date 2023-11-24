// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/enum/test_enum.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/connect_error_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import '../../../data/model_manhuongdan.dart';
import '../../utils/color.dart';
import '../../utils/palette.dart';
import '../../widgets/drawer/global_drawer.dart';
import '../../widgets/page1.dart';
import '../../widgets/skip/skip1.dart';
import '../../widgets/skip/skip2.dart';
import '../../widgets/skip/skip3.dart';
import '../../widgets/skip/skip4.dart';
import '../../widgets/skip/skip5.dart';

class ManHuongDanTestScreen extends StatefulWidget {
  static const routeName = 'man-huong-dan-test';
  const ManHuongDanTestScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ManHuongDanTestScreen> createState() => _ManHuongDanTestScreenState();
}

class _ManHuongDanTestScreenState extends State<ManHuongDanTestScreen> {
  final _controller = PageController(
    initialPage: 0,
  );

  int index = 0;

  @override
  void initState() {
    context.read<TestBloc>().add(TestGuideEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      endDrawer: GlobalDrawer(
        size: screenSize,
        scaffoldKey: scaffoldKey,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.center,
          child: TitleText(
            text: 'Hướng Dẫn Test',
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icons/back_button.png',
            scale: 3,
          ),
        ),
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
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            if (state is TestStateGuide) {
              return Container(
                child: Column(
                  children: [
                    // 5 cai luot luot
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        width: screenSize.width * 0.89,
                        height: screenSize.height * 0.005,
                        //color: Colors.green,
                        child: Row(
                          children: [
                            if (dataManHuongDanTest[index].id == 0) ...[
                              Skip1Widget(),
                            ] else if (dataManHuongDanTest[index].id == 1) ...[
                              Skip2Widget(),
                            ] else if (dataManHuongDanTest[index].id == 2) ...[
                              Skip3Widget(),
                            ] else if (dataManHuongDanTest[index].id == 3) ...[
                              Skip4Widget(),
                            ] else if (dataManHuongDanTest[index].id == 4) ...[
                              Skip5Widget(),
                            ]
                          ],
                        ),
                      ),
                    ),
                    //text va video va anh
                    Expanded(
                      flex: 11,
                      child: Container(
                        //color: Colors.amber,
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _controller,
                          onPageChanged: (value) {},
                          children: [
                            Page1(
                              index: index,
                              video: state.videos[index].link_video,
                              image: state.images[index].link_video,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //2 button o duoi
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  border: Border.all(color: Palette.title),
                                ),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    shadowColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                  ),
                                  child: Text(
                                    'Quay lại',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.title,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (index == 0) {
                                      Navigator.of(context).pop();
                                    } else {
                                      if (dataManHuongDanTest[index].testEnum ==
                                          TestEnum.video) {
                                        index--;
                                        setState(() {});
                                      } else {
                                        index--;
                                        setState(() {});
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  gradient: LinearGradient(
                                    colors: [rose500, rose300],
                                  ),
                                ),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    shadowColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                  ),
                                  onPressed: () async {
                                    if (index == 4) {
                                      return null;
                                    }
                                    if (index < 4) {
                                      if (dataManHuongDanTest[index].testEnum ==
                                          TestEnum.video) {
                                        index++;
                                        setState(() {});
                                      } else {
                                        index++;
                                        setState(() {});
                                      }
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      if (index == 4) ...[
                                        Text(
                                          'Bắt đầu Test',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ] else if (index != 4) ...[
                                        Text(
                                          'Tiếp tục',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is TestStateFailure) {
              return ConnectErrorScreen(
                  voidCallback: () =>
                      context.read<TestBloc>().add(TestCheckEvent()));
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
