import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_kienthucthaisan.dart';
import 'package:flutter_ovumb_app_version1/data/model_tuvan.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class KienThucSinhSan extends StatefulWidget {
  const KienThucSinhSan({super.key, required String maNguoiDung, required int widgetId});

  @override
  State<KienThucSinhSan> createState() => _KienThucSinhSanState();
}

class _KienThucSinhSanState extends State<KienThucSinhSan> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: GlobalDrawer(
        size: size,
        scaffoldKey: scaffoldKey,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: whiteColor,
        bottomOpacity: 0.1,
        elevation: 3,
        title: Align(
          alignment: Alignment.center,
          child: TitleText(
            text: 'Kiến thức thai sản',
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
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              height: 170,
              width: size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: dataTuVan[1][0].textColor.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],
                  gradient: dataTuVan[1][0].backgroundColor,
                  borderRadius: BorderRadius.circular(18)),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 24, top: 10),
                    width: size.width,
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            dataKienThucThaiSan[0].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Text(
                            dataKienThucThaiSan[0].describle,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1.4),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.038,
                          width: size.width * 0.23,
                          margin: EdgeInsets.only(right: 60, bottom: 5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            child: Text(
                              dataTuVan[1][0].textButton,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: dataTuVan[1][0].textColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                            onPressed: () async {
                              await showToast(
                                  context, 'Tính năng sắp được cập nhật');
                              // context.read<MainBloc>().add(AllBlogEvent());
                              // Navigator.pushNamed(context, BlogScreen.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.asset(
                        dataTuVan[1][0].imageAsset,
                        scale: 3.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 170,
              width: size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: dataTuVan[1][1].textColor.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],
                  gradient: dataTuVan[1][1].backgroundColor,
                  borderRadius: BorderRadius.circular(18)),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 24),

                    width: size.width,
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: Text(
                            dataKienThucThaiSan[1].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 180),
                          child: Text(
                            dataKienThucThaiSan[1].describle,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1.4),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.035,
                          width: size.width * 0.23,
                          margin: EdgeInsets.only(right: 60, bottom: 5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            child: Text(
                              dataTuVan[1][1].textButton,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: dataTuVan[1][1].textColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                            onPressed: () {
                              showToast(context, 'Tính năng sắp được cập nhật');
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const DoiNguChuyenGia(
                              //       widgetId: 0,
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.asset(
                        dataTuVan[1][1].imageAsset,
                        scale: 3.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}