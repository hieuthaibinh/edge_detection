import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_tiemchung.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/tiemchung/tonghopmuitiem.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_full_container.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/phase3/textbutton.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

//index=9, i=3
class HomeTiemChung extends StatefulWidget {
  int index;
  int i;
  HomeTiemChung({
    super.key,
    required this.index,
    required this.i,
    required int widgetId,
  });

  @override
  State<HomeTiemChung> createState() => _HomeTiemChungState();
}

class _HomeTiemChungState extends State<HomeTiemChung> {
  bool isTapped = true;
  int value = 0;
  bool isPedding = false;
  bool isShowPicker = false;
  double top = 265;
  List<String> list = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          leading: IconButton(
            color: Color(0xfffd6f8e),
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
            onPressed: () {
              tiemchung[0].isCheckbox = !tiemchung[0].isCheckbox;
              //tiemchung[0].isCheckbox = true;
              setState(() {});
            },
          ),
          centerTitle: true,
          title: Text(
            'Tiêm Chủng',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: grey700,
            ),
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          actions: [
            IconButton(
              //onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              onPressed: () {
                //tiemchung[1].isCheckbox = !tiemchung[1].isCheckbox;
                setState(() {});
              },
              icon: Image.asset(
                'assets/icons/right_home_icon.png',
                scale: 3,
              ),
            ),
          ],
        ),
        body: ListView(
          key: PageStorageKey<String>('page'),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 0),
              height: 80,
              width: size.width,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 22,
                    width: size.width,
                    child: Text(
                      'Xin chào mẹ bé Abc',
                      style: TextStyle(
                        color: grey700,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 20,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: thangTiemChung.length,
                      itemBuilder: (context, index) {
                        return value == index
                            ? Text(
                                'Tháng tuổi này bé cần ' +
                                    thangTiemChung[index]
                                        .isCheckbox
                                        .length
                                        .toString() +
                                    ' mũi tiêm chủng',
                                style: TextStyle(
                                  color: grey500,
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                //bảng tiêm chủng
                Container(
                  color: Colors.transparent,
                  height: 375,
                  margin: EdgeInsets.only(top: 265),
                  width: size.width,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: thangTiemChung.length, //=index
                    itemBuilder: (context, index) {
                      return value == index
                          ? Container(
                              // thangTiemChung[index].isCheckbox.length
                              height: 300,
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              color: Colors.transparent,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                reverse: false,
                                itemCount:
                                    thangTiemChung[index].isCheckbox.length, //=i
                                itemBuilder: (context, i) {
                                  return TextButton(
                                    style: const ButtonStyle(
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.transparent),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.transparent),
                                      shadowColor: MaterialStatePropertyAll(
                                          Colors.transparent),
                                    ),
                                    child: Container(
                                      height: 100,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.04),
                                            spreadRadius: 0.1,
                                            blurRadius: 25,
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //màu và text
                                          Container(
                                            //color: Colors.blue,
                                            width: 230,
                                            child: Row(
                                              children: [
                                                //màu
                                                Container(
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                    ),
                                                    color: thangTiemChung[index]
                                                        .color[i],
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                //text
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 18,
                                                      child: Text(
                                                        thangTiemChung[index]
                                                            .title[i],
                                                        style: TextStyle(
                                                          color: grey700,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
    
                                                    Text(
                                                      thangTiemChung[index]
                                                          .descripble[i],
                                                      style: TextStyle(
                                                        color: grey500,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    //hiển thị ngày đã pick lịch
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/lichh.png',
                                                          scale: 3,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Container(
                                                          color:
                                                              Colors.transparent,
                                                          width: 100,
                                                          child: Text(
                                                            thangTiemChung[index]
                                                                    .isCheckbox[i]
                                                                ? DateFormat(
                                                                        " dd/MM/yyyy")
                                                                    .format(
                                                                        DateTime
                                                                            .now())
                                                                    .toString()
                                                                : thangTiemChung[
                                                                                index]
                                                                            .textEditingController[
                                                                                i]
                                                                            .text ==
                                                                        ''
                                                                    ? 'Chưa tiêm'
                                                                    : thangTiemChung[
                                                                            index]
                                                                        .textEditingController[
                                                                            i]
                                                                        .text,
                                                            style: TextStyle(
                                                              color: rose400,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          //khoảng cách
                                          SizedBox(width: 1),
                                          //image penn
                                          Container(
                                            color: Colors.transparent,
                                            padding:
                                                const EdgeInsets.only(right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Transform.scale(
                                                  scale: 1.4,
                                                  child: Theme(
                                                    data: ThemeData(
                                                        unselectedWidgetColor:
                                                            rose500),
                                                    child: Checkbox(
                                                      activeColor: rose500,
                                                      shape: CircleBorder(),
                                                      value: thangTiemChung[index]
                                                          .isCheckbox[i],
                                                      onChanged: (value) {},
                                                    ),
                                                  ),
                                                ),
                                                // mũi x/y
                                                Container(
                                                  height: 25,
                                                  width: 65,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: rose25,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: Text(
                                                    'Mũi ' +
                                                        (thangTiemChung[i]
                                                                        .idCheckbox[
                                                                    index] +
                                                                1)
                                                            .toString() +
                                                        '/' +
                                                        dataMuiTiem[i]
                                                            .somuidatiem
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: rose400,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(32.0),
                                              ),
                                            ),
                                            content: Container(
                                              height: 230,
                                              width: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Bé đã được tiêm chủng?',
                                                    style: TextStyle(
                                                      color: grey700,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Hãy lựa chọn ngày tiêm chính xác để được hỗ trợ tốt nhất',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: grey700,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Divider(
                                                    thickness: 0.3,
                                                    color: Color(0xff667085),
                                                  ),
                                                  Textbutton(
                                                    text: 'Hôm nay',
                                                    textColor: Color(0xff5E6EFF),
                                                    fontWeight: FontWeight.w600,
                                                    onPressed: () {},
    
                                                    // onPressed: () {
                                                    //   {
                                                    //     thangTiemChung[index]
                                                    //         .isCheckbox[i] = true;
                                                    //     if (thangTiemChung[index]
                                                    //                     .isCheckbox[
                                                    //                 i] ==
                                                    //             true &&
                                                    //         i <=
                                                    //             thangTiemChung[
                                                    //                     index]
                                                    //                 .isCheckbox
                                                    //                 .length &&
                                                    //         thangTiemChung[index]
                                                    //                 .countTrueValue
                                                    //                 .length <
                                                    //             thangTiemChung[
                                                    //                     index]
                                                    //                 .isCheckbox
                                                    //                 .length) {
                                                    //       if (i == 0) {
                                                    //         thangTiemChung[index]
                                                    //             .countTrueValue
                                                    //             .insert(
                                                    //                 0,
                                                    //                 thangTiemChung[
                                                    //                         index]
                                                    //                     .isCheckbox[0]);
                                                    //       }
                                                    //       if (i == 1) {
                                                    //         thangTiemChung[index]
                                                    //             .countTrueValue
                                                    //             .insert(
                                                    //                 1,
                                                    //                 thangTiemChung[
                                                    //                         index]
                                                    //                     .isCheckbox[1]);
                                                    //       }
                                                    //       if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           0) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 0;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           1) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 1;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           2) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 2;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           3) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 3;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           4) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 4;
                                                    //       }
                                                    //     }
                                                    //   }
                                                    //   Navigator.of(context)
                                                    //       .pop(true);
                                                    //   setState(() {});
                                                    // },
                                                  ),
                                                  Divider(
                                                    thickness: 0.3,
                                                    color: Color(0xff667085),
                                                  ),
                                                  Textbutton(
                                                    text: 'Chọn ngày tiêm',
                                                    textColor: violet600,
                                                    fontWeight: FontWeight.w400,
                                                    onPressed: () {},
                                                    // onPressed: () {
                                                    //   _selectedDateTime(
                                                    //       BuildContext
                                                    //           context) async {
                                                    //     final DateTime? picker =
                                                    //         await showDatePicker(
                                                    //       builder:
                                                    //           (context1, child) {
                                                    //         return Theme(
                                                    //           data: ThemeData(
                                                    //             colorScheme:
                                                    //                 ColorScheme
                                                    //                     .light(
                                                    //               primary:
                                                    //                   rose400, // header background color
                                                    //             ),
                                                    //             dialogTheme:
                                                    //                 DialogTheme(
                                                    //               shape:
                                                    //                   RoundedRectangleBorder(
                                                    //                 borderRadius:
                                                    //                     BorderRadius
                                                    //                         .all(
                                                    //                   Radius
                                                    //                       .circular(
                                                    //                           28),
                                                    //                 ),
                                                    //               ),
                                                    //             ),
                                                    //           ),
                                                    //           child: child!,
                                                    //         );
                                                    //       },
                                                    //       context: context,
                                                    //       initialDate:
                                                    //           DateTime.now(),
                                                    //       firstDate:
                                                    //           DateTime.now(),
                                                    //       lastDate: DateTime(
                                                    //           DateTime.now().year,
                                                    //           DateTime.now()
                                                    //               .month,
                                                    //           30),
                                                    //     );
                                                    //     if (picker != null) {
                                                    //       String formattedDate =
                                                    //           DateFormat(
                                                    //                   " dd/MM/yyyy")
                                                    //               .format(picker);
                                                    //       setState(() {
                                                    //         isShowPicker = true;
                                                    //         // show ra ngày đã chọn
                                                    //         thangTiemChung[index]
                                                    //                 .textEditingController[
                                                    //                     i]
                                                    //                 .text =
                                                    //             formattedDate
                                                    //                 .toString();
                                                    //       });
                                                    //     } else {}
                                                    //   }
                                                    //   _selectedDateTime(context);
                                                    //   if (thangTiemChung[index]
                                                    //           .textEditingController[
                                                    //               i]
                                                    //           .text !=
                                                    //       DateFormat(
                                                    //               " dd/MM/yyyy")
                                                    //           .format(
                                                    //               DateTime.now())
                                                    //           .toString()) {
                                                    //     thangTiemChung[index]
                                                    //             .isCheckbox[i] =
                                                    //         false;
                                                    //     if (thangTiemChung[index]
                                                    //                     .isCheckbox[
                                                    //                 i] ==
                                                    //             false &&
                                                    //         i <
                                                    //             thangTiemChung[
                                                    //                     index]
                                                    //                 .countTrueValue
                                                    //                 .length &&
                                                    //         thangTiemChung[index]
                                                    //                 .countTrueValue
                                                    //                 .length <=
                                                    //             thangTiemChung[
                                                    //                     index]
                                                    //                 .isCheckbox
                                                    //                 .length) {
                                                    //       thangTiemChung[index]
                                                    //           .countTrueValue
                                                    //           .remove(thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue[i]);
                                                    //       if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           0) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 0;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           1) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 1;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           2) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 2;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           3) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 3;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           4) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 4;
                                                    //       }
                                                    //     }
                                                    //   } else if (thangTiemChung[
                                                    //               index]
                                                    //           .textEditingController[
                                                    //               i]
                                                    //           .text ==
                                                    //       DateFormat(
                                                    //               " dd/MM/yyyy")
                                                    //           .format(
                                                    //               DateTime.now())
                                                    //           .toString()) {
                                                    //     thangTiemChung[index]
                                                    //         .isCheckbox[i] = true;
                                                    //     if (thangTiemChung[index]
                                                    //                     .isCheckbox[
                                                    //                 i] ==
                                                    //             true &&
                                                    //         i <=
                                                    //             thangTiemChung[
                                                    //                     index]
                                                    //                 .isCheckbox
                                                    //                 .length &&
                                                    //         thangTiemChung[index]
                                                    //                 .countTrueValue
                                                    //                 .length <
                                                    //             thangTiemChung[
                                                    //                     index]
                                                    //                 .isCheckbox
                                                    //                 .length) {
                                                    //       thangTiemChung[index]
                                                    //           .countTrueValue
                                                    //           .add(thangTiemChung[
                                                    //                   index]
                                                    //               .isCheckbox[i]);
                                                    //       if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           0) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 0;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           1) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 1;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           2) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 2;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           3) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 3;
                                                    //       } else if (thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length ==
                                                    //           4) {
                                                    //         thangTiemChung[index]
                                                    //             .somuidatiem = 4;
                                                    //       }
                                                    //     }
                                                    //   }
                                                    //   // phải gọi hàm này ở đây, nếu k gọi thì kể cả viết hàm này ở trên cũng ko ăn thua
                                                    //   setState(() {});
                                                    // },
                                                  ),
                                                  Divider(
                                                    thickness: 0.3,
                                                    color: Color(0xff667085),
                                                  ),
                                                  Textbutton(
                                                    text: 'Hủy',
                                                    textColor: rose400,
                                                    fontWeight: FontWeight.w400,
                                                    onPressed: () {},
                                                    // onPressed: () {
                                                    //   thangTiemChung[index]
                                                    //           .isCheckbox[i] =
                                                    //       false;
                                                    //   if (thangTiemChung[index]
                                                    //                   .isCheckbox[
                                                    //               i] ==
                                                    //           false &&
                                                    //       i <
                                                    //           thangTiemChung[
                                                    //                   index]
                                                    //               .countTrueValue
                                                    //               .length &&
                                                    //       thangTiemChung[index]
                                                    //               .countTrueValue
                                                    //               .length <=
                                                    //           thangTiemChung[
                                                    //                   index]
                                                    //               .isCheckbox
                                                    //               .length) {
                                                    //     if (i == 0) {
                                                    //       thangTiemChung[index]
                                                    //           .countTrueValue
                                                    //           .removeAt(
                                                    //             0,
                                                    //           );
                                                    //     }
                                                    //     if (i == 1) {
                                                    //       thangTiemChung[index]
                                                    //           .countTrueValue
                                                    //           .removeAt(
                                                    //             1,
                                                    //           );
                                                    //     }
                                                    //     if (thangTiemChung[index]
                                                    //                     .isCheckbox[
                                                    //                 0] ==
                                                    //             false &&
                                                    //         thangTiemChung[index]
                                                    //                     .isCheckbox[
                                                    //                 1] ==
                                                    //             false) {
                                                    //       thangTiemChung[index]
                                                    //           .countTrueValue
                                                    //           .clear();
                                                    //       thangTiemChung[index]
                                                    //               .somuidatiem =
                                                    //           i + 1;
                                                    //     }
                                                    //     if (thangTiemChung[
                                                    //                 index]
                                                    //             .countTrueValue
                                                    //             .length ==
                                                    //         0) {
                                                    //       thangTiemChung[index]
                                                    //           .somuidatiem = 0;
                                                    //     } else if (thangTiemChung[
                                                    //                 index]
                                                    //             .countTrueValue
                                                    //             .length ==
                                                    //         1) {
                                                    //       thangTiemChung[index]
                                                    //           .somuidatiem = 1;
                                                    //     } else if (thangTiemChung[
                                                    //                 index]
                                                    //             .countTrueValue
                                                    //             .length ==
                                                    //         2) {
                                                    //       thangTiemChung[index]
                                                    //           .somuidatiem = 2;
                                                    //     } else if (thangTiemChung[
                                                    //                 index]
                                                    //             .countTrueValue
                                                    //             .length ==
                                                    //         3) {
                                                    //       thangTiemChung[index]
                                                    //           .somuidatiem = 3;
                                                    //     } else if (thangTiemChung[
                                                    //                 index]
                                                    //             .countTrueValue
                                                    //             .length ==
                                                    //         4) {
                                                    //       thangTiemChung[index]
                                                    //           .somuidatiem = 4;
                                                    //     }
                                                    //   }
                                                    //   thangTiemChung[index]
                                                    //       .textEditingController[
                                                    //           i]
                                                    //       .text = '';
                                                    //   Navigator.of(context)
                                                    //       .pop(true);
                                                    //   setState(() {});
                                                    // }
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
    
                                      // if (thangTiemChung[index].image ==
                                      //     'assets/images/done11.png') {}
                                      // thangTiemChung[index].isCheckbox[i] =
                                      //     dataMuiTiem[widget.index]
                                      //         .isCheckbox[index];
                                      // setState(() {});
                                    },
                                  );
                                },
                              ),
                            )
                          : SizedBox();
                    },
                  ),
                ),
                //text
                Container(
                  color: Colors.transparent,
                  height: 270,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: InkWell(
                          child: HomeFullContainer(
                            title: 'Các mốc tiêm và mũi tiêm',
                            sub:
                                'Mẹ hãy nhớ đưa con đi tiêm chủng đúng lịch và đầy đủ mũi tiêm',
                            image: 'assets/images/lich11.png',
                            directFrom: Alignment.bottomRight,
                            directTo: Alignment.topLeft,
                            fromColor: rose300,
                            toColor: rose500,
                            textColor: Colors.white,
                          ),
                          onTap: () {
                            tiemchung[0].isCheckbox = false;
                            // //TongHopMuiTiem
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TongHopMuiTiem(widgetId: widget.index),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      //2 dòng text bé đã được tiêm và bé cần đc tiêm
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        height: 94,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: thangTiemChung.length,
                          itemBuilder: (context, index) {
                            //widget.index = index;
                            return value == index
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: size.width,
                                        child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: (thangTiemChung[index]
                                                          .isCheckbox
                                                          .length -
                                                      thangTiemChung[index]
                                                          .somuidatiem) ==
                                                  0
                                              ? 1
                                              : 2,
                                          itemBuilder: (context, i) {
                                            widget.index = index;
                                            widget.i = i;
                                            return Row(
                                              children: [
                                                Image.asset(
                                                  textTiemChung[i].image,
                                                  scale: 3,
                                                ),
                                                SizedBox(width: 5),
                                                RichText(
                                                  text: TextSpan(
                                                    text: textTiemChung[i].text1,
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            ////////////////////////////////////////////////////////////////////////
                                                            //index cua text, i=1 va i=2
                                                            // i == 0
                                                            //     ? thangTiemChung[
                                                            //             index]
                                                            //         .somuidatiem
                                                            //         .toString()
                                                            //     : (thangTiemChung[
                                                            //                     index]
                                                            //                 .isCheckbox
                                                            //                 .length -
                                                            //             thangTiemChung[
                                                            //                     index]
                                                            //                 .somuidatiem)
                                                            //         .toString(),
                                                            'ok',
                                                        style: TextStyle(
                                                          color: textTiemChung[i]
                                                              .numberColor,
                                                          fontFamily: 'Inter',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: textTiemChung[i]
                                                                .text2,
                                                            style: TextStyle(
                                                              color: grey700,
                                                              fontFamily: 'Inter',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight.w400,
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
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        height: 35,
                                        margin:
                                            EdgeInsets.only(top: 10, left: 10),
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Hiện tại ',
                                            children: [
                                              TextSpan(
                                                text: (index + 1).toString() +
                                                    ' tháng tuổi',
                                                style: TextStyle(
                                                  color: grey400,
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                            style: TextStyle(
                                              color: grey700,
                                              fontFamily: 'Inter',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox();
                          },
                        ),
                      ),
                      //hiện tại mấy tháng tuổi
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 16),
                        height: 65,
                        width: size.width,
                        color: Colors.transparent,
                        child: Timeline.tileBuilder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          builder: TimelineTileBuilder.connected(
                            itemCount: thangTiemChung.length,
                            connectionDirection: ConnectionDirection.before,
                            indicatorBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  //các ô tròn
                                  Container(
                                    height: 55,
                                    width: 60,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Image.asset(
                                            value == index
                                                ? thangTiemChung[index]
                                                                .isCheckbox
                                                                .length -
                                                            thangTiemChung[index]
                                                                .somuidatiem ==
                                                        0
                                                    ? thangTiemChung[index]
                                                            .image =
                                                        'assets/images/done11.png'
                                                    : thangTiemChung[index]
                                                                .month
                                                                .month ==
                                                            DateTime.now().month
                                                        ? thangTiemChung[index]
                                                                .image =
                                                            'assets/images/pedding.png'
                                                        : thangTiemChung[index]
                                                                .image =
                                                            'assets/images/arrow1.png'
                                                : thangTiemChung[index].image =
                                                    'assets/images/arrow1.png',
                                            scale: 3.2,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          'Tháng ' +
                                              thangTiemChung[index]
                                                  .month
                                                  .month
                                                  .toString(),
                                          style: TextStyle(
                                            color: grey500,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //thanh ngang nối các ô tròn
                                  value == index
                                      ? thangTiemChung[index].isCheckbox.length -
                                                  thangTiemChung[index]
                                                      .somuidatiem ==
                                              0
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 30),
                                              color: rose400,
                                              height: 2,
                                              width: 80,
                                            )
                                          : index < 8
                                              ? Container(
                                                  margin:
                                                      EdgeInsets.only(bottom: 30),
                                                  color: grey300,
                                                  height: 2,
                                                  width: 80,
                                                )
                                              : SizedBox()
                                      : Container(
                                          margin: EdgeInsets.only(bottom: 30),
                                          color: grey300,
                                          height: 2,
                                          width: 80,
                                        ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/refresh.png',
                    scale: 3,
                    color: rose500,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Làm mới dữ liệu tháng',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: rose500,
                    ),
                  ),
                ],
              ),
              onPressed: () {},
              // onPressed: () {
              //   thangTiemChung[widget.index].isCheckbox[0] = false;
              //   thangTiemChung[widget.index].isCheckbox[1] = false;
              //   thangTiemChung[widget.index].textEditingController[0].text ==
              //       'Chưa tiêm';
              //   thangTiemChung[widget.index].textEditingController[1].text ==
              //       'Chưa tiêm';
              //   setState(() {});
              // },
            ),
          ],
        ),
      ),
    );
  }
}
