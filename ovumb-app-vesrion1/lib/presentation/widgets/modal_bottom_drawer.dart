// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/thaiki/thaiki_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/logo_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ModalBottomDrawer extends StatelessWidget {
  final String maNguoiDung;
  final int phase;
  final String title;
  const ModalBottomDrawer({
    Key? key,
    required this.maNguoiDung,
    required this.phase,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        height: 280,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            child: Column(
              children: [
                const TitleText(
                  text: 'Lưu ý',
                  fontWeight: FontWeight.w700,
                  size: 18,
                  color: rose500,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          'Sau khi thao tác xóa hồ sơ thai kỳ của bạn thì tính năng ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: grey700,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: grey700,
                          ),
                          children: [
                            TextSpan(
                              text: ' sẽ bắt đầu',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: grey700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            rose25,
                            rose25,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(38),
                      ),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ButtonStyle(
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          )),
                          elevation: MaterialStateProperty.all(0),
                          fixedSize: MaterialStateProperty.all(
                            Size(
                              screenSize.width * 0.4,
                              screenSize.height * 0.06,
                            ),
                          ),
                          //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                        ),
                        child: Text(
                          'Quay lại',
                          style: PrimaryFont.semibold(16, FontWeight.w600)
                              .copyWith(
                            color: rose400,
                          ),
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            rose500,
                            rose300,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(38),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          LoadingDialog().show(
                              context: context, text: 'Đang xóa dữ liệu...');
                          final check =
                              await ThaiKiRepository().deleteNgayDuSinh();
                          final check1 = await ServerRepository()
                              .updatePhase(phase: phase);
                          if (check && check1) {
                            await LocalRepository()
                                .deleteThaiKi(maNguoiDung: maNguoiDung);
                            await LocalRepository().updatePhase(phase);
                            LoadingDialog().hide();
                            Navigator.pushNamedAndRemoveUntil(context,
                                LogoScreen.routeName, (route) => false);
                          } else {
                            LoadingDialog().hide();
                            showErrorDialog(context,
                                'Lỗi xóa dữ liệu. Vui lòng kiểm tra lại kết nối mạng');
                          }
                        },
                        style: ButtonStyle(
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          )),
                          elevation: MaterialStateProperty.all(0),
                          fixedSize: MaterialStateProperty.all(
                            Size(
                              screenSize.width * 0.4,
                              screenSize.height * 0.06,
                            ),
                          ),
                          //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                        ),
                        child: Text(
                          'Xóa thai kỳ',
                          style: PrimaryFont.semibold(16, FontWeight.w600)
                              .copyWith(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
