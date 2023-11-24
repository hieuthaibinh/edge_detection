// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_amhuong.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_baby.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_body_detail.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_mockham.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/kienthucsinhsan.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/mockham_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/sp_ho_tro.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_half_container.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/phase2/am_huong_dau_doi.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/phase2/hanh_trang_don_be.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/phase2/loi_khuyen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/phase2/loi_nhac.dart';
import 'dart:math' as math;

class BodyDetailScreen extends StatefulWidget {
  DateTime ngayDuSinh;
  final int widgetId;
  BodyDetailScreen(
      {super.key, required this.widgetId, required this.ngayDuSinh});

  @override
  State<BodyDetailScreen> createState() => _BodyDetailScreenState();
}

class _BodyDetailScreenState extends State<BodyDetailScreen> {
  late ScrollController _scrollController;
  var currentIndex = 0;
  bool isClick1 = true;
  bool isClick2 = false;
  bool isClick3 = false;
  bool isClick4 = false;
  late DateTime
      ngay; //ngày đã trừ đi 30 .  dataNgayDuSinh[0].ngaydusinh: ngày pick ở lịch
  late int currentMonth;

  @override
  void initState() {
    currentMonth = widget.widgetId;
    showNgayCuoiCung();
    showCurrentMonthOfBaby(1);
    super.initState();
  }

  showCurrentMonthOfBaby(int seconds) {
    List<double> space = [0, 0.17, 0.585, 1, 1.45, 1.88, 2.3, 2.74, 3];
    for (int i = 0; i < 9; i++) {
      if (DateTime.now().month == dataCacThangCoBau[i].thang) {
        currentIndex = i;
        currentMonth = i;
      }
    }
    setState(() {});
  }

  showNgayCuoiCung() {
    ngay = widget.ngayDuSinh.subtract(Duration(days: 30));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            color: Color(0xfffd6f8e),
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
              // volumn stop
              dataAmHuong[0].isPlaying = false;
              dataAmHuong[1].isPlaying = false;
              dataAmHuong[2].isPlaying = false;
              setState(() {});
            },
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo_app.png',
            scale: 7,
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
        ),
        body: ListView(
          key: PageStorageKey<String>('page'),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              height: 80,
              width: size.width,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    width: 250,
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Xin chào mẹ!',
                      style: TextStyle(
                        color: grey700,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    width: 250,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: size.height * 0.005),
                    child: RichText(
                      text: TextSpan(
                        text: 'Hiện tại là tháng thứ ',
                        children: [
                          TextSpan(
                            text: '${currentMonth + 1}',
                            //text: (widget.widgetId + 1).toString(),
                            style: TextStyle(
                              color: grey700,
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: ' của thai kỳ',
                                style: TextStyle(
                                  color: grey700,
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                        style: TextStyle(
                          color: grey700,
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      child: HomeHalfContainer(
                        gradientFrom: Color(0xffFE7347),
                        gradientTo: Color(0xffFFB74A),
                        title: 'Hội Mẹ tròn\nCon vuông',
                        sub: 'Tham gia Miễn Phí',
                        image: 'assets/images/sua2.png', //
                        beginGradient: Alignment.topLeft,
                        endGradient: Alignment.bottomRight,
                      ),
                      onTap: () async {
                        await LaunchUrl.web(
                          context: context,
                          maLink: maMeTron,
                          tenLink: linkMeTron,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      child: HomeHalfContainer(
                        gradientFrom: Color(0xff3988FF),
                        gradientTo: Color(0xff84C4FE),
                        title: 'Kiến thức thai sản',
                        sub: 'Mẹo hay từ chuyên gia\ncủa OvumB',
                        image: 'assets/images/doctor1.png',
                        beginGradient: Alignment.topLeft,
                        endGradient: Alignment.bottomRight,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KienThucSinhSan(
                              maNguoiDung: '',
                              widgetId: 0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
                  height: 150,
                  width: size.width,
                  decoration: BoxDecoration(
                    //color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.1,
                        blurRadius: 25,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_detail.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                  //color: Colors.yellow,
                  height: 150,
                  width: 270,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.topLeft,
                        //color: Colors.orange,
                        height: 35,
                        width: size.width * 0.7,
                        child: Text(
                          "Bé yêu lớn bằng " + dataBaby[widget.widgetId].name,
                          style: TextStyle(
                            color: rose25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dataBabyDetail[0].text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  dataInforBaby[widget.widgetId]
                                          .height
                                          .toString() +
                                      ' cm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dataBabyDetail[1].text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  dataInforBaby[widget.widgetId]
                                          .weight
                                          .toString() +
                                      ' gr',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // can le trai cho cac thanh phan trong column
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dataBabyDetail[2].text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  (widget.ngayDuSinh.difference(DateTime.now()))
                                          .inDays
                                          .toString() +
                                      ' ngày',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: -math.pi / 20,
                  child: Container(
                    margin: EdgeInsets.only(left: 275),
                    height: 190,
                    width: 185,
                    decoration: BoxDecoration(
                      //color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(dataBaby[widget.widgetId].imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 175),
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.amber,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "* Dữ liệu chỉ là tương đối và có thể có sai số nhất định",
                          style: TextStyle(
                            color: grey400,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        height: 150,
                        width: size.width,
                        //color: Colors.amber,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => index == 0
                                        ? SanPhamHoTro()
                                        : MocKhamScreen(
                                            widgetId: widget.widgetId),
                                  ),
                                );
                              },
                              child: Container(
                                height: 120,
                                width: size.width * 0.42,
                                margin: EdgeInsets.only(
                                  right: 10,
                                  left: 4,
                                  top: 10,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.08),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      //color: Color(0xFF4CAF50),
                                      height: 80,
                                      child: Image.asset(
                                        dataBodyDetail[index].image,
                                        scale: 3,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topCenter,
                                      height: 25,
                                      width: size.width,
                                      child: Text(
                                        dataBodyDetail[index].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: grey700,
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SingleChildScrollView(
                        key: PageStorageKey<String>('page'),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              height: 33,
                              width: 100,
                              decoration: isClick1
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [rose500, rose300],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: rose500),
                                    ),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  dataButton[0].title,
                                  textAlign: TextAlign.center,
                                  style: isClick1
                                      ? TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        )
                                      : TextStyle(
                                          color: rose400,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isClick1 = true;
                                    isClick2 = false;
                                    isClick3 = false;
                                    isClick4 = false;
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: 33,
                              width: 90,
                              decoration: isClick2
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [rose500, rose300],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: rose500),
                                    ),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  dataButton[1].title,
                                  textAlign: TextAlign.center,
                                  style: isClick2
                                      ? TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        )
                                      : TextStyle(
                                          color: rose400,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isClick1 = false;
                                    isClick2 = true;
                                    isClick3 = false;
                                    isClick4 = false;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 33,
                              width: 150,
                              decoration: isClick3
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [rose500, rose300],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: rose500),
                                    ),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  (DateTime.now().compareTo(ngay) >= 0 &&
                                          dataNgayDuSinh[0]
                                                  .ngaydusinh
                                                  .compareTo(DateTime.now()) >=
                                              0)
                                      ? dataButton[3].title
                                      : dataButton[2].title,
                                  textAlign: TextAlign.center,
                                  style: isClick3
                                      ? TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        )
                                      : TextStyle(
                                          color: rose400,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isClick1 = false;
                                    isClick2 = false;
                                    isClick3 = true;
                                    isClick4 = false;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 33,
                              width: 150,
                              decoration: isClick4
                                  ? BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [rose500, rose300],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: rose500),
                                    ),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  dataButton[4].title,
                                  textAlign: TextAlign.center,
                                  style: isClick4
                                      ? TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        )
                                      : TextStyle(
                                          color: rose400,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isClick1 = false;
                                    isClick2 = false;
                                    isClick3 = false;
                                    isClick4 = true;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        alignment: Alignment.topCenter,
                        child: Column(
                          key: PageStorageKey<String>('page'),
                          children: [
                            isClick4
                                ? AmHuongDauDoi()
                                : Container(
                                    //color: Colors.green,
                                    height: 0,
                                  ),
                            isClick1 ? LoiKhuyen() : Text(''),
                            isClick2 ? LoiNhac() : Text(''),
                            isClick3 // <0: d1 truoc d2, >0: d1 sau d2
                                // ngày pick -30 < ngày hiện tại < ngày pick => đang ở tháng thứ 9
                                // ngày hiện tại < ngày pick -30 < ngày pick => đang ở tháng thứ 1-8
                                ? ((DateTime.now().compareTo(ngay) >= 0 &&
                                        widget.ngayDuSinh
                                                .compareTo(DateTime.now()) >=
                                            0)
                                    ? HanhTrangDonBe(widgetId: 0)
                                    : dataButton[2].detail)
                                : Text(''),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
