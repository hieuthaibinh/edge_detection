// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_state.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/choan_history.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/milk_bottle.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/choan_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class BuBinh extends StatefulWidget {
  final Con con;
  final int count;
  final int widgetId;
  bool isShow;
  BuBinh({
    Key? key,
    required this.con,
    required this.count,
    required this.widgetId,
    required this.isShow,
  }) : super(key: key);

  @override
  State<BuBinh> createState() => _BuBinhState();
}

class _BuBinhState extends State<BuBinh> with TickerProviderStateMixin {
  List<int> a = [0];
  List<int> b = [0];
  int value = 0;
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: widget.widgetId,
  );
  Color color = Colors.transparent;
  MilkRepository _milkRepository = MilkRepository();
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  late int index;
  TimeOfDay timeMilk =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  DateTime dateMilk = DateTime.now();
  bool checkTimeChange = false;

  @override
  void initState() {
    index = widget.widgetId;
    dataBuBinh[0].controller = TextEditingController(text: '0');
    dataBuBinh[1].controller = TextEditingController(text: '0');
    sound[0].player.stop();
    super.initState();
  }

  @override
  void dispose() {
    dataBuBinh[0].value = 0;
    dataBuBinh[1].value = 0;
    dataBuBinh[0].controller.dispose();
    dataBuBinh[1].controller.dispose();
    super.dispose();
  }

  Future<TimeOfDay?> _selectedTime(BuildContext context) async {
    final TimeOfDay? picker = await showTimePicker(
      builder: (context1, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: rose400, // header background color
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picker != null) {
      timeMilk = picker;
      checkTimeChange = true;
      // // DateTime date =
      // //     DateTime.parse(DateFormat('yyyy-MM-dd 00:00:00.000').format(picker));
      return timeMilk;
    }
    return null;
  }

  Future<DateTime?> _selectedDate(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      builder: (context1, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: rose400, // header background color
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
            datePickerTheme: DatePickerThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: dateMilk,
      firstDate: widget.con.ngaySinh,
      lastDate: DateTime.now(),
    );
    if (picker != null) {
      dateMilk = DateTime(picker.year, picker.month, picker.day, timeMilk.hour,
          timeMilk.minute);
      return dateMilk;
    }
    return null;
  }

  String _parseDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _parseTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<ChoAnBloc, ChoAnState>(
      listener: (context, state) {
        if (state is LoadingFailureState) {
          showErrorDialog(
              context, 'Lỗi kết nối. Vui lòng kiểm tra lại kết nối mạng');
        }
      },
      builder: (context, state) {
        if (state is BuBinhHistoryState) {
          return ChoAnHistory(
            maCon: widget.con.id,
            choAn: state.choAn,
            chartDataChoAn: state.chartDataChoAn,
            choAnEnum: ChoAnEnum.suacongthuc,
          );
        } else if (state is LoadingState) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: getShimmer(ChoAnShimmer()),
          );
        }
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: Container(
            height: size.height,
            margin: EdgeInsets.only(
              top: size.height * 0.03,
              left: 25,
              right: 25,
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: 480,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataNhapDuLieu[1].title,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: grey700,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            dataNhapDuLieu[1].descripble,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: grey400,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.transparent,
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await _selectedDate(context);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 40,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 9,
                                                offset: Offset(2, 2),
                                              ),
                                            ],
                                          ),
                                          width: 120,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/lich123.png',
                                                scale: 2.5,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                _parseDate(dateMilk),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  color: grey400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await _selectedTime(context);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 40,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 9,
                                                offset: Offset(2, 2),
                                              ),
                                            ],
                                          ),
                                          width: 80,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/time_add_icon.png',
                                                scale: 3,
                                                color: grey400,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                _parseTime(timeMilk),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  color: grey400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 9,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      icon: Image.asset(
                                        'assets/images/chart.png',
                                        scale: 2.5,
                                      ),
                                      onPressed: () {
                                        context.read<ChoAnBloc>().add(
                                              BuBinhHistoryEvent(
                                                  maCon: widget.con.id),
                                            );

                                        //Navigator.pushNamed(context, 'bieudotongquat');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //nút hiện tại và chart

                            //binh sua
                            Container(
                              height: 255,
                              color: Colors.transparent,
                              child: MilkBottle(
                                widgetId: index,
                                colors: [
                                  Color(0xFF7490F3),
                                  Color(0xFF7490F3),
                                  Color(0xffF7B262)
                                ],
                                suaColors: [
                                  Color(0xffE8EDFF),
                                  Color(0xffE8EDFF),
                                  Color(0xffFFF6E8),
                                ],
                                images: [
                                  'assets/images/bottle.png',
                                  'assets/images/bottle1.png'
                                ],
                                dataBuBinh: dataBuBinh,
                              ),
                            ),
                            //button

                            Container(
                              height: 60,
                              margin: EdgeInsets.only(
                                top: 5,
                                bottom: 10,
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? Color(0xffE8EDFF)
                                    : Color(0xffFFF6E8),
                                borderRadius: BorderRadius.circular(31),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 6,
                                        bottom: 6,
                                        left: 6,
                                        right: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: index == 1
                                            ? Color(0xFF7490F3)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(31),
                                      ),
                                      child: IconButton(
                                        icon: Text(
                                          dataBuBinh[0].title,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: index == 1
                                                  ? Colors.white
                                                  : Color(0xffF7B262)),
                                        ),
                                        onPressed: () {
                                          index = 1;
                                          dataBuBinh[1].isClick = true;
                                          dataBuBinh[2].isClick = false;
                                          dataBuBinh[2].value = 0;
                                          dataBuBinh[2].controller.text = '0';
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 6,
                                        bottom: 6,
                                        left: 6,
                                        right: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: index == 2
                                            ? Color(0xffF7B262)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(31),
                                      ),
                                      child: IconButton(
                                        icon: Text(
                                          dataBuBinh[1].title,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: index == 2
                                                  ? Colors.white
                                                  : Color(0xFF7490F3)),
                                        ),
                                        onPressed: () {
                                          index = 2;
                                          dataBuBinh[2].isClick = true;
                                          dataBuBinh[1].isClick = false;
                                          dataBuBinh[1].value = 0;
                                          dataBuBinh[1].controller.text = '0';
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 50,
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
                  child: IconButton(
                    icon: Text(
                      'Hoàn tất',
                      style: TextStyle(
                        color: rose25,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      if (widget.count >= 10) {
                        showErrorDialog(context,
                            'Bạn đã nhập đủ 10 lần của ngày hôm nay. Vui lòng nhập tiếp vào ngày hôm sau',
                            title: 'Cảnh báo');
                      } else {
                        num luongSua =
                            num.tryParse(dataBuBinh[index].controller.text)!;
                        ChoAnEnum type = widget.widgetId == 1
                            ? ChoAnEnum.suacongthuc
                            : ChoAnEnum.suame;
                        if (luongSua != 0) {
                          if (luongSua > 600) {
                            showToast(context,
                                'Lượng sữa hiện tại đang vượt quá 600ml. Vui lòng nhập lại lượng sữa');
                          } else {
                            LoadingLogo().show(context: context);
                            DateTime thoiGian = checkTimeChange
                                ? DateTime(
                                    dateMilk.year,
                                    dateMilk.month,
                                    dateMilk.day,
                                    timeMilk.hour,
                                    timeMilk.minute,
                                    DateTime.now().second,
                                  )
                                : DateTime(
                                    dateMilk.year,
                                    dateMilk.month,
                                    dateMilk.day,
                                    DateTime.now().hour,
                                    DateTime.now().minute,
                                    DateTime.now().second,
                                  );
                            bool? check = await _milkRepository.insertChoAn(
                              choAn: ChoAn(
                                maLoaiChoAn: getMaChoAn(type),
                                maCon: widget.con.id,
                                trongLuong: luongSua,
                                lanChoAn: widget.count + 1,
                                thoiGian: thoiGian,
                              ),
                            );
                            LoadingLogo().hide();
                            if (check == true) {
                              checkTimeChange = false;
                              dataBuBinh[index].value = 0;
                              dataBuBinh[index].controller.text = '0';
                              Navigator.pop(context);
                              context.read<MilkBloc>().add(CheckChoAnEvent(
                                  maCon: widget.con.id, date: DateTime.now()));
                              showToast(
                                context,
                                'Lượng sữa của bé đã được thêm thành công',
                                seconds: 3,
                              );
                            } else if (check == false) {
                              showErrorDialog(context,
                                  'Thêm không thành công. Vui lòng kiểm tra lại kết nối mạng');
                            } else if (check == null) {
                              showErrorDialog(context,
                                  'Thêm không thành công. Ngày bạn thêm đã vượt quá 10 lần');
                            }
                          }
                        } else {
                          showToast(context,
                              'Lượng sữa hiện tại đang là 0ml. Vui lòng thêm lượng sữa');
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<int> listChartSuaCongThuc = [0, 0, 0, 0, 0, 0, 0];
List<int> listChartSuaMe = [0, 0, 0, 0, 0, 0, 0];
