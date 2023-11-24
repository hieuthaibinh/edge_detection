// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/choan_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class AnDam extends StatefulWidget {
  int widgetId;
  final Con con;
  final int count;
  AnDam({
    Key? key,
    required this.widgetId,
    required this.con,
    required this.count,
  }) : super(key: key);

  @override
  State<AnDam> createState() => _AnDamState();
}

class _AnDamState extends State<AnDam> {
  late int value = 0;
  late bool isShowAddButton;
  MilkRepository _milkRepository = MilkRepository();
  String loaiThucPham = '';
  TimeOfDay timeMilk =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  DateTime dateMilk = DateTime.now();
  bool checkTimeChange = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    sound[0].player.stop();
    isShowAddButton = true;
    super.initState();
  }

  double? _totalAnDam() {
    try {
      double total = 0;
      for (int i = 0; i < 6; i++) {
        if (dataAnDam[i].controller.text != '') {
          total += int.parse(dataAnDam[i].controller.text);
          loaiThucPham += dataAnDam[i].title + ';';
        }
      }
      return total;
    } catch (e) {
      return null;
    }
  }

  void _clearData() {
    for (int i = 0; i < 6; i++) {
      dataAnDam[i].controller.text = '';
    }
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
        if (state is AnDamHistoryState) {
          return ChoAnHistory(
            maCon: widget.con.id,
            choAn: state.choAn,
            chartDataChoAn: state.chartDataChoAn,
            choAnEnum: ChoAnEnum.andam,
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
                            dataNhapDuLieu[2].title,
                            style: TextStyle(
                              color: grey700,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            dataNhapDuLieu[2].descripble,
                            style: TextStyle(
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
                                              AnDamHistoryEvent(
                                                  maCon: widget.con.id),
                                            );

                                        //Navigator.pushNamed(context, 'bieudotongquat');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 240,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                children: List.generate(
                                  dataAnDam.length,
                                  (index) {
                                    return Center(
                                      child: ElevatedButton(
                                        style: const ButtonStyle(
                                          overlayColor:
                                              MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          shadowColor: MaterialStatePropertyAll(
                                              Colors.transparent),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          dataAnDam[index]
                                                              .image),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    border: Border.all(
                                                        color: value == index
                                                            ? rose400
                                                            : Colors
                                                                .transparent),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: dataAnDam[index]
                                                          .controller
                                                          .text
                                                          .isEmpty
                                                      ? 41
                                                      : 30,
                                                  top: 42,
                                                  child: dataAnDam[index]
                                                          .controller
                                                          .text
                                                          .isEmpty
                                                      ? Image.asset(
                                                          'assets/images/add11.png',
                                                          scale: 4,
                                                        )
                                                      : Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 19,
                                                          width: 28,
                                                          decoration: BoxDecoration(
                                                              color: rose25,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Text(
                                                            dataAnDam[index]
                                                                    .controller
                                                                    .text +
                                                                'g',
                                                            style: TextStyle(
                                                              color: rose400,
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              dataAnDam[index].title,
                                              style: TextStyle(
                                                color: grey700,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          value = index;
                                          setState(() {});
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              color: Colors.transparent,
                              height: 75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 55,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(31),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    dataAnDam[value].image),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            dataAnDam[value].title,
                                            style: TextStyle(
                                              color: grey700,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 5,
                                          icon: Image.asset(
                                            'assets/images/trash.png',
                                            scale: 3,
                                          ),
                                          onPressed: () {
                                            dataAnDam
                                                .remove(dataAnDam[value].image);
                                            dataAnDam.remove(dataAnDam[value]
                                                .controller
                                                .text);
                                            dataAnDam
                                                .remove(dataAnDam[value].title);
                                            dataAnDam
                                                .remove(dataAnDam[value].index);
                                            dataAnDam
                                                .remove(dataAnDam[value].gram);
                                            dataAnDam
                                                .remove(dataAnDam[value].isAdd);
                                            dataAnDam[value].controller.text =
                                                '';
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 120,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: grey100,
                                        borderRadius: BorderRadius.circular(31),
                                      ),
                                      child: TextFormField(
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly // Chỉ cho phép nhập số
                                        ],
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Vui lòng không nhập kí tự';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.grey,
                                        controller: dataAnDam[value].controller,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          iconColor: grey700,
                                        ),
                                        onTapOutside: (event) {
                                          FocusScope.of(context).requestFocus(
                                            new FocusNode(),
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
                        isShowAddButton = false;
                        if (isShowAddButton == false) {
                          double? total = _totalAnDam();
                          if (total != null) {
                            if (total != 0) {
                              if (total > 1000) {
                                showErrorDialog(context,
                                    'Khuyến cáo tổng số gam không nên vượt quá 1000g');
                              } else {
                                _clearData();
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
                                    maLoaiChoAn: getMaChoAn(ChoAnEnum.andam),
                                    maCon: widget.con.id,
                                    trongLuong: total,
                                    lanChoAn: widget.count + 1,
                                    thoiGian: thoiGian,
                                    loaiThucPham: loaiThucPham,
                                  ),
                                );
                                LoadingLogo().hide();
                                if (check == true) {
                                  checkTimeChange = false;
                                  Navigator.pop(context);
                                  context.read<MilkBloc>().add(CheckChoAnEvent(
                                      maCon: widget.con.id,
                                      date: DateTime.now()));
                                  showToast(
                                    context,
                                    'Lượng thức ăn của bé đã được thêm thành công',
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
                            }
                          } else {
                            showErrorDialog(context,
                                'Không được nhập kí tự. Vui lòng nhập lại');
                          }

                          isShowAddButton = true;
                        }
                      }
                    },
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<int> listChartAnDam = [0, 0, 0, 0, 0, 0, 0];
