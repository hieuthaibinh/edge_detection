// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/thaiki/thaiki_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/overall_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_mockham.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/synchronized/synchronized_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class NgayDuSinhScreen extends StatefulWidget {
  static const routeName = 'ngaydusinh-screen';
  final int widgetId;
  final String maNguoiDung;
  final DateTime? ngayDuSinh;
  final int? phase;
  const NgayDuSinhScreen({
    Key? key,
    required this.widgetId,
    required this.maNguoiDung,
    this.ngayDuSinh,
    this.phase,
  }) : super(key: key);

  @override
  State<NgayDuSinhScreen> createState() => _NgayDuSinhScreenState();
}

class _NgayDuSinhScreenState extends State<NgayDuSinhScreen> {
  bool isShowPicker = false;
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  SynchronizedRepository _synchronizedRepository = SynchronizedRepository();
  DateTime? datePicker;
  int? weeks;
  int? day;
  int? ngaybatdau;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    if (widget.ngayDuSinh != null) {
      controller.text = DateFormat("     dd / MM / yyyy")
          .format(DateTime.parse(widget.ngayDuSinh.toString()))
          .toString();
      calculatorDate(widget.ngayDuSinh);
    }
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
      initialDate: widget.ngayDuSinh ??
          DateTime.now(), // if - null: TH con của toán tử 3 ngôi
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 280)),
    );
    if (picker != null) {
      String formattedDate = DateFormat("     dd / MM / yyyy").format(picker);
      calculatorDate(picker);
      //dataNgayDuSinh[widget.widgetId].ngayconlai = days.inDays;
      setState(() {
        isShowPicker = true;
        controller.text =
            formattedDate.toString(); // show ngay ra ở ô textfeild
      });
    } else {
      print('null');
    }
  }

  //show ra ngày bạn đã có thai
  void calculatorDate(picker) {
    datePicker = DateTime.parse(picker.toString());
    Duration days = datePicker!.difference(DateTime.now());
    ngaybatdau = 280 - days.inDays;
    weeks = (ngaybatdau! ~/ 7);
    day = ngaybatdau! % 7;
    // ngayDuSinh-  ngay hien tai = so ngay con lai
    dataNgayDuSinh[0].ngayconlai = days.inDays;
  }

  // dataNgayDuSinh[widget.widgetId].ngaydusinh la ngay pick lich
  // days = ngay pick lich - ngay hien tai => con bn ngay nua la de
  @override
  Widget build(BuildContext context) {
    // ngaybatdau = ngaydusinh - 280
    // da co thai bn tuan = ngayhientai - ngaybatdau
    final size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Ngày Dự Sinh',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              fontSize: 18,
              color: grey700,
            ),
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(left: 15, right: 15),
              margin:
                  EdgeInsets.only(left: 12, right: 12, top: size.height * 0.18),
              height: 260,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_dusinh.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Nhập ngày dự sinh',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Thông tin bạn điền sẽ được sử dụng và lưu lại để phân tích thai kỳ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      textAlign: TextAlign.left,
                      //font text nhe!
                      style: PrimaryFont.medium(19, FontWeight.w500)
                          .copyWith(color: rose400),
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // icon: icon ở đăng trước
                        // suffixIcon: icon ở đằng sau
                        suffixIcon: Image.asset(
                          'assets/buttons/ds_calendar.png',
                          scale: 3,
                        ),
                        //labelText: isShowPicker ? ' ' : '          /       /  ',
                        labelStyle: TextStyle(
                          color: rose400,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      readOnly: true, // user can not edit text
                      onTap: () {
                        _selectedDateTime(context);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bạn đã có thai: ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        weeks == null
                            ? '0 tuần ' + '0 ngày '
                            : weeks.toString() +
                                ' tuần ' +
                                day.toString() +
                                ' ngày ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                            'Lưu',
                            style: TextStyle(
                              color: rose400,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () async {
                            if (widget.ngayDuSinh != null) {
                              if (datePicker == null) {
                                showToast(context, 'Bạn chưa chọn ngày');
                              } else {
                                LoadingLogo().show(context: context);
                                bool check =
                                    await ThaiKiRepository().insertThaiKi(
                                  thaiKi: ThaiKi(
                                    maNguoiDung: widget.maNguoiDung,
                                    ngayDuSinh: datePicker,
                                  ),
                                );

                                LoadingLogo().hide();
                                if (check) {
                                  showToast(context,
                                      'Cập nhật ngày dự sinh thành công');
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    OverallScreen.routeName,
                                    (route) => false,
                                    arguments: datePicker,
                                  );
                                } else {
                                  showErrorDialog(context,
                                      'Cập nhật này dự sinh không thành công. Vui lòng kiểm tra lại kết nối mạng');
                                }
                              }
                            } else {
                              if (datePicker == null) {
                                showToast(context, 'Bạn chưa chọn ngày');
                              } else {
                                LoadingLogo().show(context: context);
                                bool checkUpdate = await ServerRepository()
                                    .updatePhase(phase: 3);
                                if (checkUpdate) {
                                  LocalRepository().updatePhase(3);
                                  bool check =
                                      await ThaiKiRepository().insertThaiKi(
                                    thaiKi: ThaiKi(
                                      maNguoiDung: widget.maNguoiDung,
                                      ngayDuSinh: datePicker,
                                    ),
                                  );
                                  LoadingLogo().hide();
                                  if (check) {
                                    showToast(context,
                                        'Cập nhật ngày dự sinh thành công');
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      OverallScreen.routeName,
                                      (route) => false,
                                      arguments: datePicker,
                                    );
                                    _synchronizedRepository
                                        .syncThaiKiToServer();
                                  } else {
                                    showErrorDialog(context,
                                        'Cập nhật này dự sinh không thành công. Vui lòng kiểm tra lại kết nối mạng');
                                  }
                                } else {
                                  LoadingLogo().hide();
                                  showErrorDialog(context,
                                      'Cập nhật này dự sinh không thành công. Vui lòng kiểm tra lại kết nối mạng');
                                }
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.22),
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
                if (widget.phase != null) {
                  LocalRepository().updatePhase(widget.phase!);
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
