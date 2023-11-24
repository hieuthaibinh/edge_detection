// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/warning_dialog.dart';
import 'package:intl/intl.dart';

import 'package:flutter_ovumb_app_version1/data/enum/nhatky_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/calender_handle.dart';
import 'package:flutter_ovumb_app_version1/data/model_nhatky.dart';
import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_tra_loi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/luong_kinh.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_logic.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/nhatky_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/checklist_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/nhatky_checkbox.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/nhatky_picker.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/nhatky_radiobutton.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/radio_button_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/radio_luongkinh.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/picker.dart';

class NhatkyScreen extends StatefulWidget {
  static const routeName = 'nhat-ky-screen';
  final int titleId;
  final NguoiDung nguoiDung;
  final List<CauHoi> listCauHoi;
  final DateTime date;
  final LuongKinh? luongKinh;
  final List<CauTraLoi> listCauTraLoi;
  final CalendarDay listCalendar;

  const NhatkyScreen({
    Key? key,
    required this.titleId,
    required this.nguoiDung,
    required this.listCauHoi,
    required this.date,
    required this.luongKinh,
    required this.listCauTraLoi,
    required this.listCalendar,
  }) : super(key: key);

  @override
  State<NhatkyScreen> createState() => _NhatkyScreenState();
}

//index =
class _NhatkyScreenState extends State<NhatkyScreen> {
  List<String> name = ['uyen'];
  String celsius = "\u00B0";

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  NhatKyLogic _nhatKyLogic = NhatKyLogic();

  String formattedDateTime = DateFormat.yMMMEd('vi').format(DateTime.now());
  String x = '';
  String y = '';
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool checkSelect = false;
  bool canUpdateCKKN = false;
  List<String> listRes = [];

  @override
  void initState() {
    controller1.text = '0';
    controller2.text = '0';
    hasData(widget.luongKinh, widget.listCauTraLoi);
    getData();

    //kiểm tra
    canUpdateCKKN = _nhatKyLogic.canUpdateCKKN(
      calendarDay: widget.listCalendar,
      selectedDay: widget.date,
    );
    // canInsertKinh = _nhatKyLogic.canInsertKinh(
    //   calendarDay: widget.listCalendar,
    //   selectedDay: widget.date,
    // );
    checkData();
    super.initState();
  }

  //kiểm tra xem trong db đã có dữ liệu chưa nếu chưa có thì reset
  void hasData(LuongKinh? luongKinh, List<CauTraLoi> listCauTraLoi) {
    if (luongKinh == null) {
      questionLuongKinh.subtitle.clear();
      answerLuongKinh.checkbox.setAll(
          0, List.generate(answerLuongKinh.detailTitle.length, (i) => false));
    }
    if (listCauTraLoi.isEmpty) {
      for (int i = 0; i < question.length; i++) {
        controller1.text = '0';
        controller2.text = '0';
        question[i].subtitle.clear();
        answer[i].checkbox.setAll(
            0, List.generate(answer[i].detailTitle.length, (i) => false));
      }
    }
  }

  // kiểm tra xem đã nhập chưa
  void checkData() {
    if (questionLuongKinh.subtitle.isNotEmpty) {
      checkSelect = true;
    }
    for (int index = 0; index < widget.listCauHoi.length; index++) {
      if (question[index].subtitle.isNotEmpty) {
        checkSelect = true;
      }
    }
  }

  // lấy dữ liệu ra từ db
  void getData() {
    if (widget.luongKinh != null) {
      questionLuongKinh.subtitle = spiltAnswer(widget.luongKinh!.luongKinh);
      questionLuongKinh.subtitle.forEach((sub) {
        for (int i = 0; i < answerLuongKinh.detailTitle.length; i++) {
          if (sub == answerLuongKinh.detailTitle[i]) {
            answerLuongKinh.checkbox[i] = true;
          }
        }
      });
    }
    for (int index = 0; index < widget.listCauTraLoi.length; index++) {
      if (widget.listCauTraLoi.isNotEmpty) {
        if (widget.listCauTraLoi[index].cauTraLoi != '') {
          checkSelect = true;
          if (index == 0) {
            final c = widget.listCauTraLoi[index].cauTraLoi!.split('.');
            controller1.text = c[0];
            controller2.text = c[1];
            question[index].subtitle = c;
          } else {
            question[index].subtitle =
                spiltAnswer(widget.listCauTraLoi[index].cauTraLoi ?? '');
            question[index].subtitle.forEach((sub) {
              for (int i = 0; i < answer[index].detailTitle.length; i++) {
                if (sub == answer[index].detailTitle[i]) {
                  answer[index].checkbox[i] = true;
                }
              }
            });
          }
        } else {
          question[index].subtitle.clear();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //scroll
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Scaffold(
            key: scaffoldKey,
            endDrawer: GlobalDrawer(
              size: screenSize,
              scaffoldKey: scaffoldKey,
            ),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Ngày ${convertDateTime(widget.date)}',
                style: const TextStyle(
                  color: Color(0xff333e52),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ),
              ),
              leading: Container(
                color: Colors.white,
                // alignment: Alignment.centerLeft,
                // padding: EdgeInsets.only(left: 10),
                child: ElevatedButton.icon(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  icon: const SizedBox(
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage('assets/icons/back_button.png'),
                      color: Color(0xfffd6f8e),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  label: const Text(''),
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
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 10),
                if (questionLuongKinh.subtitle.isEmpty)
                  Container(
                    height: 80,
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          rose500,
                          rose300,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (canUpdateCKKN) {
                          showModalBottomSheet(
                            isDismissible: false,
                            enableDrag: false,
                            backgroundColor: Palette.textColor.withOpacity(0.7),
                            barrierColor: rose300.withOpacity(0.1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return RadioLuongKinhButton();
                            },
                          ).then((value) => setState(() {
                                checkData();
                              }));
                        } else {
                          warningDialog(context, screenSize);
                        }
                      },
                      style: const ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        shadowColor:
                            MaterialStatePropertyAll(Colors.transparent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  canUpdateCKKN
                                      ? questionLuongKinh.title
                                      : 'Chu kỳ kinh',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: 'Inter'),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  canUpdateCKKN
                                      ? 'Không có'
                                      : 'Không thể nhập thông tin chu kỳ kinh?',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Image.asset(
                                canUpdateCKKN
                                    ? 'assets/icons/next_button.png'
                                    : 'assets/icons/note.png',
                                scale: 3,
                                color: whiteColor,
                              ), //neu
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (questionLuongKinh.subtitle.isNotEmpty)
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          rose500,
                          rose300,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          enableDrag: false,
                          backgroundColor: Palette.textColor.withOpacity(0.7),
                          barrierColor: rose300.withOpacity(0.1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return RadioLuongKinhButton();
                          },
                        ).then((value) => setState(() {
                              checkData();
                            }));
                      },
                      style: const ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        shadowColor:
                            MaterialStatePropertyAll(Colors.transparent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    checkSelect
                                        ? questionLuongKinh.title
                                        : 'Chu kỳ kinh',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: 'Inter'),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    height: 30,
                                    child: Container(
                                      height: 25,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: whiteColor),
                                      ),
                                      child: Text(
                                        questionLuongKinh.subtitle.last,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              checkSelect
                                  ? 'assets/icons/next_button.png'
                                  : 'assets/icons/note.png',
                              scale: 3,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                Container(
                  //color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  //height: screenSize.height,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: question.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (question[index].subtitle.isEmpty) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 50,
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            border: Border.all(color: const Color(0xfffd6f8d)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                // isDismissible: false,
                                // enableDrag: false,
                                backgroundColor:
                                    Palette.textColor.withOpacity(0.7),
                                barrierColor: rose300.withOpacity(0.1),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(32),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  // BackdropFilter(
                                  //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),child: ,
                                  // );
                                  switch (question[index].type) {
                                    case NhatKyEnum.radiobutton:
                                      return RadioButton(titleId: index);
                                    case NhatKyEnum.checkbox:
                                      return CheckListScreen(titleId: index);
                                    case NhatKyEnum.normal:
                                      return Picker(
                                        titleId: index,
                                        controller1: controller1,
                                        controller2: controller2,
                                      );
                                    default:
                                      return Picker(
                                        titleId: index,
                                        controller1: controller1,
                                        controller2: controller2,
                                      );
                                  }
                                },
                              ).then((value) => setState(() {
                                    checkData();
                                  }));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Text(
                                    widget.listCauHoi[index].noiDung,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color(0xfffd6f8e),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'assets/icons/plus.png',
                                    scale: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            //color: Colors.green,
                            border: Border.all(color: const Color(0xfffd6f8d)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                // isDismissible: false,
                                // enableDrag: false,
                                backgroundColor:
                                    Palette.textColor.withOpacity(0.7),
                                barrierColor: rose300.withOpacity(0.1),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(32),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  switch (question[index].type) {
                                    case NhatKyEnum.radiobutton:
                                      return RadioButton(titleId: index);
                                    case NhatKyEnum.checkbox:
                                      return CheckListScreen(titleId: index);
                                    case NhatKyEnum.normal:
                                      return Picker(
                                        titleId: index,
                                        controller1: controller1,
                                        controller2: controller2,
                                      );
                                    default:
                                      return Picker(
                                        titleId: index,
                                        controller1: controller1,
                                        controller2: controller2,
                                      );
                                  }
                                },
                              ).then((value) => setState(() {
                                    checkData();
                                  }));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          question[index].title,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Color(0xfffd6f8e),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        if (question[index].type ==
                                            NhatKyEnum.radiobutton) ...[
                                          NhatKyRadioButton(
                                            item: question[index].subtitle.last,
                                          ),
                                        ],
                                        if (question[index].type ==
                                            NhatKyEnum.checkbox) ...[
                                          NhatKyCheckBox(
                                            items: question[index].subtitle,
                                          )
                                        ],
                                        if (question[index].type ==
                                            NhatKyEnum.normal) ...[
                                          NhatKyPicker(
                                            controller1: controller1,
                                            controller2: controller2,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'assets/icons/next_button.png',
                                    scale: 3,
                                    color: Color(0xfffd6f8e),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              height: 100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          rose600,
                          rose500,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(38),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: ElevatedButton(
                    onPressed: () async {
                      await _nhatKyLogic.saveNhatKy(
                        context: context,
                        connected: connected,
                        maNguoiDung: widget.nguoiDung.maNguoiDung,
                        date: widget.date,
                        listCauHoi: listCauHoi,
                        listCauTraLoi: widget.listCauTraLoi,
                        question: question,
                        questionLuongKinh: questionLuongKinh,
                        luongKinh: widget.luongKinh,
                        listCalendar: widget.listCalendar,
                        controller1: controller1.text,
                        controller2: controller2.text,
                        canUpdateCKKN: canUpdateCKKN,
                      );
                    },
                    style: ButtonStyle(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      fixedSize:
                          MaterialStatePropertyAll(Size(screenSize.width, 50)),
                      //foregroundColor: MaterialStateProperty.all(roseTitleText),
                    ),
                    child: Text(
                      'Lưu thông tin',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: const SizedBox(),
      ),
    );
  }
}
