import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_tiemchung.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/tiemchung/danhsachmuitiem.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:intl/intl.dart';

class TongHopMuiTiem extends StatefulWidget {
  int widgetId;
  TongHopMuiTiem({
    super.key,
    required this.widgetId,
  });

  @override
  State<TongHopMuiTiem> createState() => _TongHopMuiTiemState();
} 

class _TongHopMuiTiemState extends State<TongHopMuiTiem> {
  bool isShowPicker = false;
  int value = 0;

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
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/right_home_icon.png',
                scale: 3,
              ),
            ),
          ],
        ),
        body: AnimatedCrossFade(
          crossFadeState: tiemchung[0].isCheckbox
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 500),
          firstChild: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
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
                          'Tổng hợp các mũi tiêm của bé',
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
                                    'Mẹ hãy nhớ đưa con đi tiêm đầy đủ các mũi',
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
                      height: 1000,
                      width: size.width,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: thangTiemChung.length, //=index
                        itemBuilder: (context, index) {
                          return value == index
                              ? Container(
                                  // thangTiemChung[index].isCheckbox.length
                                  height: 1000,
                                  padding:
                                      const EdgeInsets.only(left: 12, right: 12),
                                  color: Colors.transparent,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    reverse: false,
                                    itemCount: thangTiemChung[index]
                                        .isCheckbox
                                        .length, //=i
                                    itemBuilder: (context, i) {
                                      dataMuiTiem[0].isCheckbox[index] =
                                          thangTiemChung[0].isCheckbox[0];
                                      dataMuiTiem[1].isCheckbox[index] =
                                          thangTiemChung[0].isCheckbox[1];
                                      dataMuiTiem[0]
                                              .textEditingController[index]
                                              .text =
                                          thangTiemChung[0]
                                              .textEditingController[0]
                                              .text;
                                      dataMuiTiem[1]
                                              .textEditingController[index]
                                              .text =
                                          thangTiemChung[0]
                                              .textEditingController[1]
                                              .text;
                                      return TextButton(
                                        style: const ButtonStyle(
                                          overlayColor: MaterialStatePropertyAll(
                                              Colors.transparent),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          shadowColor: MaterialStatePropertyAll(
                                              Colors.transparent),
                                        ),
                                        child: Container(
                                          //  dataMuiTiem[i].somuidatiem
                                          height: dataMuiTiem[i].somuidatiem == 1
                                              ? 80
                                              : dataMuiTiem[i].somuidatiem == 2
                                                  ? 110
                                                  : dataMuiTiem[i].somuidatiem ==
                                                          3
                                                      ? 140
                                                      : 165,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              //màu và text
                                              Container(
                                                color: Colors.transparent,
                                                width: 260,
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
                                                        color:
                                                            thangTiemChung[index]
                                                                .color[i],
                                                      ),
                                                    ),
                                                    SizedBox(width: 20),
                                                    //text
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 15),
                                                        //title
                                                        SizedBox(
                                                          height: 17,
                                                          child: Align(
                                                            alignment:
                                                                Alignment.topLeft,
                                                            child:
                                                                AnimatedTextKit(
                                                              totalRepeatCount: 1,
                                                              animatedTexts: [
                                                                RotateAnimatedText(
                                                                  'Tiêm mũi ' +
                                                                      thangTiemChung[
                                                                              index]
                                                                          .title[i],
                                                                  rotateOut:
                                                                      false,
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  textStyle:
                                                                      TextStyle(
                                                                    color:
                                                                        grey700,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        //descripble
                                                        Container(
                                                          height: dataMuiTiem[i]
                                                                      .somuidatiem ==
                                                                  1
                                                              ? 30
                                                              : dataMuiTiem[i]
                                                                          .somuidatiem ==
                                                                      1
                                                                  ? 60
                                                                  : dataMuiTiem[i]
                                                                              .somuidatiem ==
                                                                          1
                                                                      ? 90
                                                                      : 115,
                                                          color:
                                                              Colors.transparent,
                                                          width:
                                                              size.width * 0.55,
                                                          child: ListView.builder(
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                dataMuiTiem[i]
                                                                    .somuidatiem,
                                                            itemBuilder:
                                                                (context, index) {
                                                              return Container(
                                                                height: 29,
                                                                color: Colors
                                                                    .transparent,
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      height: 7,
                                                                      width: 7,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: dataMuiTiem[i].isCheckbox[
                                                                                index]
                                                                            ? const Color(
                                                                                0xff0AAC99)
                                                                            : rose500,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                100),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 5),
                                                                    Text(
                                                                      dataMuiTiem[i].isCheckbox[
                                                                              index]
                                                                          ? 'Đã tiêm mũi ' +
                                                                              (index + 1).toString() +
                                                                              ' ' +
                                                                              '(' +
                                                                              DateFormat("dd/MM/yyyy").format(DateTime.now()).toString() +
                                                                              ')'
                                                                          : dataMuiTiem[i].textEditingController[index].text != '' || thangTiemChung[index].textEditingController[widget.widgetId].text != ''
                                                                              ? 'Chuẩn bị tiêm mũi ' + (index + 1).toString() + ' ' + '(' + dataMuiTiem[i].textEditingController[index].text + ' )'
                                                                              : 'Chưa tiêm mũi ' + (index + 1).toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: dataMuiTiem[i].isCheckbox[
                                                                                index]
                                                                            ? Color(
                                                                                0xff0AAC99)
                                                                            : rose500,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(),
                                                        //hiển thị ngày đã chọn
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              //khoảng cách
                                              SizedBox(width: 1),
                                              //image penn
                                              Container(
                                                alignment: Alignment.topRight,
                                                width: 50,
                                                padding: EdgeInsets.only(
                                                    top: 15, right: 20),
                                                color: Colors.transparent,
                                                child: Image.asset(
                                                  'assets/images/penn.png',
                                                  scale: 3,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        onPressed: () {
                                          thangTiemChung[index].isCheckbox[i] =
                                              dataMuiTiem[i].isCheckbox[index];
                                          ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DanhSachMuiTiem(
                                                widgetId: i, //index
                                              ),
                                            ),
                                          );
                                          setState(() {});
                                        },
                                      );
                                    },
                                  ),
                                )
                              : SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          secondChild: SizedBox(
            height: size.height,
            width: size.width,
          ),
        ),
      ),
    );
  }
}
