// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/model_choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/milk_bottle.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/home3_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class KichSuaInput extends StatefulWidget {
  static const routeName = 'kich-sua-input';
  final int count;
  final Con con;
  const KichSuaInput({
    Key? key,
    required this.count,
    required this.con,
  }) : super(key: key);

  @override
  State<KichSuaInput> createState() => _KichSuaInputState();
}

class _KichSuaInputState extends State<KichSuaInput> {
  DateTime date = DateTime.now();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  MilkRepository _milkRepository = MilkRepository();
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<Color> colors = [violet500, rose400];
  List<Color> suaColors = [violet100, rose50];

  int index = 0;

  TimeOfDay timeMilk =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  DateTime dateMilk = DateTime.now();

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
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffafafa),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 170,
              width: size.width,
              child: Image.asset(
                'assets/images/bg_phase4_3.png',
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              key: scaffoldKey,
              endDrawer: Home3Drawer(
                size: size,
                scaffoldKey: scaffoldKey,
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Hành Trình Kích Sữa',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: rose25,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                leading: Container(
                  color: Colors.transparent,
                  // alignment: Alignment.centerLeft,
                  // padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton.icon(
                    style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                    ),
                    icon: const SizedBox(
                      height: 20,
                      width: 20,
                      child: ImageIcon(
                        AssetImage('assets/buttons/back.png'),
                        color: rose25,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    label: const Text(''),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                    icon: Image.asset(
                      'assets/buttons/menu.png',
                      scale: 3,
                      color: rose25,
                    ),
                  ),
                ],
              ),
              body: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 20,
                ),
                padding: EdgeInsets.only(
                  left: 5,
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                child: Container(
                  height: size.height,
                  padding: EdgeInsets.only(top: 100),
                  margin: EdgeInsets.only(
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
                                  'Hút sữa cho mẹ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: grey700,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Kéo ngưỡng sữa trong bình dưới bằng với ngưỡng sữa khi hút',
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
                                  //nút hiện tại và chart
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: grey400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
                                      colors: colors,
                                      suaColors: suaColors,
                                      images: [
                                        'assets/images/bottle2.png',
                                        'assets/images/bottle3.png'
                                      ],
                                      dataBuBinh: dataKichSua,
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
                                      color: suaColors[index],
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
                                              color: index == 0
                                                  ? colors[0]
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(31),
                                            ),
                                            child: IconButton(
                                              icon: Text(
                                                dataKichSua[0].title,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: index == 0
                                                        ? Colors.white
                                                        : colors[1]),
                                              ),
                                              onPressed: () {
                                                index = 0;
                                                dataKichSua[0].isClick = true;
                                                dataKichSua[1].isClick = false;
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
                                              color: index == 1
                                                  ? colors[1]
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(31),
                                            ),
                                            child: IconButton(
                                              icon: Text(
                                                dataKichSua[1].title,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: index == 1
                                                        ? Colors.white
                                                        : colors[0]),
                                              ),
                                              onPressed: () {
                                                index = 1;
                                                dataKichSua[1].isClick = true;
                                                dataKichSua[0].isClick = false;
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
                            if (widget.count >= 12) {
                              showErrorDialog(
                                context,
                                'Bạn đã nhập đủ 12 lần của ngày hôm nay. Vui lòng nhập tiếp vào ngày hôm sau',
                                title: 'Cảnh báo',
                              );
                            } else {
                              double vuTrai =
                                  double.parse(dataKichSua[1].controller.text);
                              double vuPhai =
                                  double.parse(dataKichSua[0].controller.text);
                              if (vuTrai != 0 || vuPhai != 0) {
                                LoadingLogo().show(context: context);
                                bool? check =
                                    await _milkRepository.insertHutSua(
                                  hutSua: HutSua(
                                    lanChoAn: widget.count + 1,
                                    vuTrai: vuTrai,
                                    vuPhai: vuPhai,
                                    ngayTao: DateTime(
                                      dateMilk.year,
                                      dateMilk.month,
                                      dateMilk.day,
                                      timeMilk.hour,
                                      timeMilk.minute,
                                      DateTime.now().second,
                                    ),
                                  ),
                                );
                                LoadingLogo().hide();
                                if (check = true) {
                                  dataKichSua[0].value = 0;
                                  dataKichSua[1].value = 0;
                                  dataKichSua[0].controller.text = '0';
                                  dataKichSua[1].controller.text = '0';
                                  Navigator.pop(context);
                                  context.read<ChoAnBloc>().add(KichSuaEvent());
                                  showToast(
                                    context,
                                    'Lượng sữa đã được thêm thành công',
                                    seconds: 3,
                                  );
                                } else if (check == false) {
                                  showErrorDialog(context,
                                      'Thêm không thành công. Vui lòng kiểm tra lại kết nối mạng');
                                } else if (check == null) {
                                  showErrorDialog(context,
                                      'Thêm không thành công. Ngày bạn thêm đã vượt quá 10 lần');
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
