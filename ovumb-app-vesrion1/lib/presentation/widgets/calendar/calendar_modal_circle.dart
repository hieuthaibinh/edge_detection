// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/calendar/calendar_day.dart';
import 'package:flutter_ovumb_app_version1/data/models/modal/calendar_modal.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nhatky/nhatky_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/nhat_ky_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

import '../../utils/color.dart';

//hình tròn để hiển thị ngày và có nút chỉnh sửa thông tin khi hiện modal bottomf chọn ngày trong lịch
class CalendarModalCircle extends StatelessWidget {
  final int dayOfChuKi;
  final int check;
  final List<CauHoi> listCauHoi;
  final NguoiDung nguoiDung;
  final DateTime date;
  final CalendarDay listCalendar;
  final int indexModal;
  const CalendarModalCircle({
    Key? key,
    required this.dayOfChuKi,
    required this.check,
    required this.listCauHoi,
    required this.nguoiDung,
    required this.date,
    required this.listCalendar,
    required this.indexModal,
    required this.size,
  }) : super(key: key);

  final Size size;

  //đây là hình tròn của Modal Bottom Calendar khi show lên
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: CircleAvatar(
        radius: size.width * 0.29,
        backgroundColor: calendarModal[indexModal].circle2,
        child: CircleAvatar(
          radius: size.width * 0.27,
          backgroundColor: calendarModal[indexModal].circle1,
          child: Container(
            height: size.width * 0.5,
            width: size.width * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  calendarModal[indexModal].beginColor,
                  calendarModal[indexModal].endColor,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(400),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Chu kỳ\nKinh nguyệt',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Inter',
                  ).copyWith(
                    color: whiteColor,
                  ),
                ),
                TitleText(
                  text: dayOfChuKi == 0
                      ? 'Không rõ'
                      : 'Ngày thứ ${dayOfChuKi.toString()}',
                  fontWeight: FontWeight.w700,
                  size: 24,
                  color: whiteColor,
                ),
                TextButton(
                  onPressed: () async {
                    if (date.isBefore(DateTime.now())) {
                      final listCauTraLoi =
                          await NhatKyRepository().getListCauTraLoi(
                        maNguoiDung: nguoiDung.maNguoiDung,
                        date: date,
                      );
                      final luongKinh = await NhatKyRepository().getLuongKinh(
                        maNguoiDung: nguoiDung.maNguoiDung,
                        date: date,
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        NhatkyScreen.routeName,
                        arguments: {
                          'listCauHoi': listCauHoi,
                          'nguoiDung': nguoiDung,
                          'date': date,
                          'luongKinh': luongKinh,
                          'listCauTraLoi': listCauTraLoi,
                          'listCalendar': listCalendar,
                        },
                      );
                    } else {
                      showToast(context,
                          "Bạn chỉ có thể chỉnh sửa ngày hiện tại hoặc ngày trước đó");
                    }
                  },
                  style: ButtonStyle(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor: const MaterialStatePropertyAll(whiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Chỉnh sửa',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ).copyWith(
                      color: calendarModal[indexModal].textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
