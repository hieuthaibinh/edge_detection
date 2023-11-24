import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan5_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class DoiNguChuyenGia extends StatefulWidget {
  static const routeName = 'tuvan3-screen';
  final int widgetId;
  const DoiNguChuyenGia({super.key, required this.widgetId});

  @override
  State<DoiNguChuyenGia> createState() => _DoiNguChuyenGiaState();
}

class _DoiNguChuyenGiaState extends State<DoiNguChuyenGia> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // shuffleModels();
    super.initState();
  }

  // void shuffleModels() {
  //   var random = Random();
  //   dataModalTuVan.shuffle(random);
  // }

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          title: Align(
            alignment: Alignment.center,
            child: TitleText(
              text: 'Đội ngũ chuyên gia',
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
        body: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          //margin: EdgeInsets.only(top: 25),
          //width: sizeWidth,
          child: Column(
            children: [
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chuyên gia của OvumB',
                    style: TextStyle(
                      color: grey700,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Đội ngũ chuyên gia chuyên nghiệp, tận tâm, đồng hành 24/7',
                    style: TextStyle(
                      color: grey500,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Container(
                height: 500,
                width: 500,
                color: Colors.transparent,
                child: ScrollConfiguration(
                  key: PageStorageKey<String>('page'),
                  behavior: ScrollBehavior(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      key: PageStorageKey<String>('page'),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Image.asset(
                                    '',
                                    alignment: Alignment.bottomCenter,
                                    //fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Chuyên gia',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                          color: Color(0xff667085),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '',
                                        style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Color(0xff667085),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Palette.title,
                                    border: Border.all(color: Palette.title),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        Tuvan5Screen.routeName,
                                        arguments: index,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/chat.png',
                                          scale: 3,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Chat',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: rose25,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
