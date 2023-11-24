import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_tiemchung.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/phase3/textbutton.dart';
import 'package:intl/intl.dart';

// widget.widgetId - khi pick vào 1 ô từ class trước, id của ô đó sẽ đc lưu vào đây, khi chuyên sang class này thì widget.widgetId sẽ mang giá trị của id của ô ở bên class trc
// index - là id của cả list to chứa tất cả các loại mũi tiêm
// i - là id của list nhỏ chứa tổng só mũi tiêm của mỗi loại mũi tiêm
class DanhSachMuiTiem extends StatefulWidget {
  int widgetId;
  DanhSachMuiTiem({
    super.key,
    required this.widgetId,
  });

  @override
  State<DanhSachMuiTiem> createState() => _DanhSachMuiTiemState();
}

class _DanhSachMuiTiemState extends State<DanhSachMuiTiem> {
  bool isShowPicker = false;
  int value = 0;
  int id = 0;
  bool isSaveData = false;
  List<int> valueList = [];
  String lich = '';

  @override
  void initState() {
    valueList.add(value);
    //main();
    super.initState();
  }

  void main() {
    List<String> listTextEdittingController = [
      thangTiemChung[0].textEditingController.toString(),
    ];
    List DupCountry = [];
    listTextEdittingController.forEach((dup) {
      if (DupCountry.contains(dup)) {
      } else {
        DupCountry.add(dup);
      }
    });
  }

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
              Navigator.of(context).pop();
              setState(() {});
            },
          ),
          centerTitle: true,
          title: Text(
            'Danh Sách Mũi Tiêm',
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
                Navigator.of(context).pop();
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
                      'Danh sách mũi ' +
                          thangTiemChung[widget.widgetId]
                              .title[widget.widgetId],
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
                    child: Text(
                      'Dưới đây là danh sách các lần cần tiêm theo tháng',
                      style: TextStyle(
                        color: grey500,
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //list
            Container(
              color: Colors.transparent,
              height: 650,
              width: size.width,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 13, //dataMuiTiem.length,
                itemBuilder: (context, index) {
                  return value == index // index không liên quan
                      ? Column(
                          children: [
                            Container(
                              height: 500,
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              color: Colors.transparent,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    dataMuiTiem[widget.widgetId].somuidatiem,
                                itemBuilder: (context, i) {
                                  // i mới liên quan
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
                                            color:
                                                Colors.grey.withOpacity(0.04),
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
                                                    color: value == i
                                                        ? rose400
                                                        : dataMuiTiem[widget.widgetId]
                                                                        .isCheckbox[
                                                                    i] ==
                                                                true
                                                            ? rose400
                                                            : rose400
                                                                .withOpacity(
                                                                    0.4),
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
                                                        //dataMuiTiem[index].name
                                                        'Tiêm mũi ' +
                                                            thangTiemChung[
                                                                        index]
                                                                    .title[
                                                                widget
                                                                    .widgetId],
                                                        style: TextStyle(
                                                          color: value == i
                                                              ? grey700
                                                              : dataMuiTiem[widget.widgetId]
                                                                              .isCheckbox[
                                                                          i] ==
                                                                      true
                                                                  ? grey700
                                                                  : grey700
                                                                      .withOpacity(
                                                                          0.4),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      thangTiemChung[index]
                                                              .descripble[
                                                          widget.widgetId],
                                                      style: TextStyle(
                                                        color: value == i
                                                            ? grey500
                                                            : dataMuiTiem[widget.widgetId]
                                                                            .isCheckbox[
                                                                        i] ==
                                                                    true
                                                                ? grey500
                                                                : grey500
                                                                    .withOpacity(
                                                                        0.4),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    // //hiển thị ngày đã pick lịch
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/lichh.png',
                                                          scale: 3,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: 100,
                                                          child: Text(
                                                            dataMuiTiem[widget
                                                                            .widgetId]
                                                                        .isCheckbox[
                                                                    i]
                                                                ? DateFormat(
                                                                        " dd/MM/yyyy")
                                                                    .format(
                                                                        DateTime
                                                                            .now())
                                                                    .toString()
                                                                : dataMuiTiem[widget.widgetId]
                                                                            .textEditingController[
                                                                                i]
                                                                            .text ==
                                                                        ''
                                                                    ? 'Chưa tiêm'
                                                                    : dataMuiTiem[widget
                                                                            .widgetId]
                                                                        .textEditingController[
                                                                            i]
                                                                        .text,
                                                            style: TextStyle(
                                                              color: rose400,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
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
                                          //image ô checkbox
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
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
                                                      unselectedWidgetColor: i ==
                                                              0
                                                          ? rose500
                                                          : dataMuiTiem[widget.widgetId]
                                                                          .isCheckbox[
                                                                      i] ==
                                                                  true
                                                              ? rose500
                                                              : rose500
                                                                  .withOpacity(
                                                                      0.4),
                                                    ),
                                                    child: Checkbox(
                                                      activeColor: value == i
                                                          ? rose500
                                                          : dataMuiTiem[widget.widgetId]
                                                                          .isCheckbox[
                                                                      i] ==
                                                                  true
                                                              ? rose500
                                                              : rose500
                                                                  .withOpacity(
                                                                      0.4),
                                                      shape: CircleBorder(),
                                                      value: dataMuiTiem[
                                                              widget.widgetId]
                                                          .isCheckbox[i],
                                                      onChanged: (value) {},
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 65,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: value == i
                                                          ? rose25
                                                          : dataMuiTiem[widget.widgetId]
                                                                          .isCheckbox[
                                                                      i] ==
                                                                  true
                                                              ? rose25
                                                              : rose25
                                                                  .withOpacity(
                                                                      0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: Text(
                                                    'Mũi ' +
                                                        (i + 1).toString() +
                                                        '/' +
                                                        dataMuiTiem[
                                                                widget.widgetId]
                                                            .somuidatiem
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: value == i
                                                          ? rose400
                                                          : dataMuiTiem[widget.widgetId]
                                                                          .isCheckbox[
                                                                      i] ==
                                                                  true
                                                              ? rose400
                                                              : rose400
                                                                  .withOpacity(
                                                                      0.4),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                      id = i;
                                      if (value == i) {
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        'Hãy lựa chọn ngày tiêm chính xác để được hỗ trợ tốt nhất',
                                                        textAlign:
                                                            TextAlign.center,
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
                                                      textColor:
                                                          Color(0xff5E6EFF),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      onPressed: () {},
                                                      // onPressed: () {
                                                      //   {
                                                      //     dataMuiTiem[widget
                                                      //                 .widgetId]
                                                      //             .isCheckbox[i] =
                                                      //         true;
                                                      //     if (dataMuiTiem[widget
                                                      //                         .widgetId]
                                                      //                     .isCheckbox[
                                                      //                 i] ==
                                                      //             true &&
                                                      //         i <
                                                      //             dataMuiTiem[widget
                                                      //                     .widgetId]
                                                      //                 .isCheckbox
                                                      //                 .length &&
                                                      //         thangTiemChung[widget
                                                      //                     .widgetId]
                                                      //                 .countTrueValue
                                                      //                 .length <
                                                      //             dataMuiTiem[widget
                                                      //                     .widgetId]
                                                      //                 .isCheckbox
                                                      //                 .length) {
                                                      //       thangTiemChung[widget
                                                      //               .widgetId]
                                                      //           .countTrueValue
                                                      //           .add(dataMuiTiem[
                                                      //                   widget
                                                      //                       .widgetId]
                                                      //               .isCheckbox[i]);
                                                      //       if (thangTiemChung[widget
                                                      //                   .widgetId]
                                                      //               .countTrueValue
                                                      //               .length ==
                                                      //           1) {
                                                      //         thangTiemChung[widget
                                                      //                 .widgetId]
                                                      //             .somuidatiem = 1;
                                                      //       }
                                                      //       if (thangTiemChung[widget
                                                      //                   .widgetId]
                                                      //               .countTrueValue
                                                      //               .length ==
                                                      //           2) {
                                                      //         thangTiemChung[widget
                                                      //                 .widgetId]
                                                      //             .somuidatiem = 2;
                                                      //       }
                                                      //       if (thangTiemChung[widget
                                                      //                   .widgetId]
                                                      //               .countTrueValue
                                                      //               .length ==
                                                      //           3) {
                                                      //         thangTiemChung[widget
                                                      //                 .widgetId]
                                                      //             .somuidatiem = 3;
                                                      //       }
                                                      //       if (thangTiemChung[widget
                                                      //                   .widgetId]
                                                      //               .countTrueValue
                                                      //               .length ==
                                                      //           4) {
                                                      //         thangTiemChung[widget
                                                      //                 .widgetId]
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      onPressed: () {},
                                                      // onPressed: () {
                                                      //   _selectedDateTime(
                                                      //       BuildContext
                                                      //           context) async {
                                                      //     final DateTime? picker =
                                                      //         await showDatePicker(
                                                      //       builder: (context1,
                                                      //           child) {
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
                                                      //                   Radius.circular(
                                                      //                       28),
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
                                                      //           DateTime.now()
                                                      //               .year,
                                                      //           DateTime.now()
                                                      //               .month,
                                                      //           30),
                                                      //     );
                                                      //     if (picker != null) {
                                                      //       String formattedDate =
                                                      //           DateFormat(
                                                      //                   "dd/MM/yyyy")
                                                      //               .format(
                                                      //                   picker);
                                                      //       setState(() {
                                                      //         isShowPicker = true;
                                                      //         // show ra ngày đã chọn
                                                      //         for (int i = 0;
                                                      //             i < 2;
                                                      //             i++) {}
                                                      //         dataMuiTiem[index]
                                                      //                 .textEditingController[
                                                      //                     i]
                                                      //                 .text =
                                                      //             formattedDate
                                                      //                 .toString();
                                                      //       });
                                                      //     } else {}
                                                      //   }
                                                      //   _selectedDateTime(
                                                      //       context);
                                                      //   if (dataMuiTiem[widget
                                                      //               .widgetId]
                                                      //           .textEditingController[
                                                      //               i]
                                                      //           .text !=
                                                      //       DateFormat(
                                                      //               " dd/MM/yyyy")
                                                      //           .format(DateTime
                                                      //               .now())
                                                      //           .toString()) {
                                                      //     dataMuiTiem[widget
                                                      //                 .widgetId]
                                                      //             .isCheckbox[i] =
                                                      //         false;
                                                      //   } else if (dataMuiTiem[
                                                      //               widget
                                                      //                   .widgetId]
                                                      //           .textEditingController[
                                                      //               i]
                                                      //           .text ==
                                                      //       DateFormat(
                                                      //               " dd/MM/yyyy")
                                                      //           .format(DateTime
                                                      //               .now())
                                                      //           .toString()) {
                                                      //     dataMuiTiem[widget
                                                      //                 .widgetId]
                                                      //             .isCheckbox[i] =
                                                      //         true;
                                                      //   }
                                                      //   if (thangTiemChung[widget
                                                      //               .widgetId]
                                                      //           .countTrueValue
                                                      //           .length ==
                                                      //       1) {
                                                      //     thangTiemChung[
                                                      //             widget.widgetId]
                                                      //         .somuidatiem = 1;
                                                      //   }
                                                      //   if (thangTiemChung[widget
                                                      //               .widgetId]
                                                      //           .countTrueValue
                                                      //           .length ==
                                                      //       2) {
                                                      //     thangTiemChung[
                                                      //             widget.widgetId]
                                                      //         .somuidatiem = 2;
                                                      //   }
                                                      //   if (thangTiemChung[widget
                                                      //               .widgetId]
                                                      //           .countTrueValue
                                                      //           .length ==
                                                      //       3) {
                                                      //     thangTiemChung[
                                                      //             widget.widgetId]
                                                      //         .somuidatiem = 3;
                                                      //   }
                                                      //   if (thangTiemChung[widget
                                                      //               .widgetId]
                                                      //           .countTrueValue
                                                      //           .length ==
                                                      //       4) {
                                                      //     thangTiemChung[
                                                      //             widget.widgetId]
                                                      //         .somuidatiem = 4;
                                                      //   }
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      onPressed: () {},
                                                      // onPressed: () {
                                                      //   dataMuiTiem[widget
                                                      //               .widgetId]
                                                      //           .isCheckbox[i] =
                                                      //       false;
                                                      //   if (dataMuiTiem[widget
                                                      //                       .widgetId]
                                                      //                   .isCheckbox[
                                                      //               i] ==
                                                      //           false &&
                                                      //       i <=
                                                      //           dataMuiTiem[widget
                                                      //                   .widgetId]
                                                      //               .isCheckbox
                                                      //               .length &&
                                                      //       thangTiemChung[widget
                                                      //                   .widgetId]
                                                      //               .countTrueValue
                                                      //               .length <
                                                      //           dataMuiTiem[widget
                                                      //                   .widgetId]
                                                      //               .isCheckbox
                                                      //               .length) {
                                                      //     if (i == 0) {
                                                      //       thangTiemChung[widget
                                                      //               .widgetId]
                                                      //           .countTrueValue
                                                      //           .removeAt(
                                                      //             0,
                                                      //           );
                                                      //     }
                                                      //     if (i == 1) {
                                                      //       thangTiemChung[widget
                                                      //               .widgetId]
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
                                                      // },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            //button
                            Container(
                              color: Colors.transparent,
                              height: 120,
                              width: size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // button luu
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          rose400,
                                          rose600,
                                        ],
                                      ),
                                    ),
                                    child: TextButton(
                                      style: const ButtonStyle(
                                        overlayColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                      ),
                                      child: Text(
                                        'Lưu dữ liệu',
                                        style: TextStyle(
                                          color: rose25,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      onPressed: () {},
                                      // onPressed: () {
                                      //   if (dataMuiTiem[widget.widgetId]
                                      //               .isCheckbox[id] ==
                                      //           true &&
                                      //       isShowPicker == false &&
                                      //       index <=
                                      //           dataMuiTiem[widget.widgetId]
                                      //               .somuidatiem) {
                                      //     value++;
                                      //     valueList.add(value);
                                      //   }
                                      //   //Navigator.of(context).pop(true);
                                      //   setState(() {});
                                      // },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: size.width,
                                    child: TextButton(
                                      style: const ButtonStyle(
                                        overlayColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.transparent),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/refresh.png',
                                            scale: 3,
                                            color: rose500,
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'Làm mới dữ liệu',
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
                                      //   for (int n = 0;
                                      //       n <
                                      //           dataMuiTiem[index]
                                      //               .isCheckbox
                                      //               .length;
                                      //       n++) {
                                      //     dataMuiTiem[index].isCheckbox[n] =
                                      //         false;
                                      //     dataMuiTiem[index]
                                      //         .textEditingController[n]
                                      //         .text = 'Chưa tiêm';
                                      //   }
                                      //   setState(() {});
                                      // },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
