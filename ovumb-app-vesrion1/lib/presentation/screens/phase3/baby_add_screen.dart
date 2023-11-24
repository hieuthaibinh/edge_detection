// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/validator/register_validator.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class BabyAddScreen extends StatefulWidget {
  static const routeName = 'baby-add-screen';
  BabyAddScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BabyAddScreen> createState() => _BabyAddScreenState();
}

class _BabyAddScreenState extends State<BabyAddScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  MilkRepository _milkRepository = MilkRepository();
  DateTime? _datePicker;

  bool isMale = true;

  @override
  void initState() {
    super.initState();
  }

  _selectedDateTime(BuildContext context) async {
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
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1000)),
      lastDate: DateTime.now(),
    );
    if (picker != null) {
      String formattedDate = DateFormat("dd/MM/yyyy").format(picker);
      setState(() {
        _datePicker = picker;
        _dateController.text = formattedDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.2,
              child: Image.asset(
                'assets/images/bg_phase4_2.png',
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.1),
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.contain,
                        scale: 3,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                RegisterInput(
                                  name: 'Họ và tên',
                                  iconUrl: 'assets/icons/user_unactive.png',
                                  controller: _nameController,
                                  isClick: false,
                                  isPassword: false,
                                ),
                                const SizedBox(height: 24),
                                GestureDetector(
                                  onTap: () => _selectedDateTime(context),
                                  child: RegisterInput(
                                    name: 'Ngày sinh',
                                    iconUrl:
                                        'assets/icons/calendar_unactive.png',
                                    controller: _dateController,
                                    isClick: false,
                                    isPassword: false,
                                    enabled: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            height: 50,
                            width: size.width,
                            //color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Image.asset(
                                      'assets/images/sex.png',
                                      scale: 3,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Giới tính của bé',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: rose400,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 35),
                                  height: 45,
                                  width: 150,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        !isMale ? rose500 : Color(0xff7BA0FF),
                                        !isMale ? rose300 : Color(0xff4168F2),
                                      ],
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 6,
                                          bottom: 6,
                                          left: 6,
                                        ),
                                        width: 65,
                                        decoration: BoxDecoration(
                                          color: isMale
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(31),
                                        ),
                                        child: IconButton(
                                          icon: Text(
                                            'Nam',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: !isMale
                                                  ? Colors.white
                                                  : Color(0xff4168f2),
                                            ),
                                          ),
                                          onPressed: () {
                                            isMale = !isMale;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 6,
                                          bottom: 6,
                                          right: 6,
                                        ),
                                        width: 65,
                                        decoration: BoxDecoration(
                                          color: !isMale
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(31),
                                        ),
                                        child: IconButton(
                                          icon: Text(
                                            'Nữ',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: !isMale
                                                  ? rose400
                                                  : Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            isMale = !isMale;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 120),
                          Container(
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
                            child: IconButton(
                              icon: Text(
                                'Tiếp tục',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: rose25,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () async {
                                String? check = babyUpdateValidator([
                                  _nameController,
                                  _dateController,
                                ]);
                                if (check == null) {
                                  LoadingLogo().show(context: context);
                                  Con con = Con(
                                    id: 0,
                                    ten: _nameController.text.trim(),
                                    ngaySinh: _datePicker!,
                                    gioiTinh: isMale ? 'Nam' : 'Nữ',
                                  );
                                  bool? check =
                                      await _milkRepository.insert(con: con);
                                  LoadingLogo().hide();
                                  if (check) {
                                    showToast(context,
                                        'Thêm bé thành công. Bạn đã chuyển sang bé ${_nameController.text.trim()}');
                                    Navigator.pushNamed(
                                        context, Home3.routeName);
                                  } else {
                                    showErrorDialog(context,
                                        'Thêm bé không thành công. Vui lòng kiểm tra lại kết nối mạng');
                                  }
                                } else {
                                  showToast(context, check);
                                }
                              },
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Quay lại',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: rose400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// [] {}
class ThongTinBe {
  TextEditingController ten;
  TextEditingController ngaysinh;
  String gioitinh;
  ThongTinBe(
    this.ten,
    this.ngaysinh,
    this.gioitinh,
  );
}

List<ThongTinBe> thongTinBe = [
  ThongTinBe(
    TextEditingController(text: 'Tên bé'),
    TextEditingController(),
    'Không',
  ),
];
