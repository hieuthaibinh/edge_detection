// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/nguoidung/nguoidung_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/synchronized/synchronized_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_bloc.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/questionU_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';
import '../../../logic/bloc/main/main_event.dart';
import '../../utils/color.dart';
import '../../utils/primary_font.dart';
import '../../widgets/title_text.dart';

class QuestionUpdateScreen extends StatefulWidget {
  static const routeName = 'question-update-screen';
  final KinhNguyet kinhNguyet;
  const QuestionUpdateScreen({
    Key? key,
    required this.kinhNguyet,
  }) : super(key: key);

  @override
  State<QuestionUpdateScreen> createState() => _QuestionUpdateScreenState();
}

class _QuestionUpdateScreenState extends State<QuestionUpdateScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
  PageController controller = PageController();
  List<TextEditingController> question = [
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
    question[0].text = widget.kinhNguyet.tbnkn.toString();
    question[1].text = widget.kinhNguyet.snck.toString();
  }

  bool check() {
    for (TextEditingController ques in question) {
      if (ques.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool checkValueChange() {
    if (question[0].text == widget.kinhNguyet.tbnkn.toString() &&
        question[1].text == widget.kinhNguyet.snck.toString()) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: rose400,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.center,
                          child: TitleText(
                            text: 'Cập nhật thông tin',
                            fontWeight: FontWeight.w600,
                            size: 18,
                            color: greyText,
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: QuestionUScreen(
                      question1: question[0],
                      question2: question[1],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              rose600,
                              rose400,
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
                      child: OfflineBuilder(
                        connectivityBuilder: (
                          BuildContext context,
                          ConnectivityResult connectivity,
                          Widget child,
                        ) {
                          return ElevatedButton(
                            onPressed: () async {
                              final bool connected =
                                  connectivity != ConnectivityResult.none;
                              if (check()) {
                                final check =
                                    await _kinhNguyetRepository.updateTBNKN(
                                  tbnkn: int.parse(question[0].text),
                                  snck: int.parse(question[1].text),
                                );
                                await NguoiDungRepository()
                                    .updateTrangThai(trangThai: 0);
                                if (check) {
                                  showToast(context,
                                      'Cập nhật thông tin kinh nguyệt thành công');
                                }

                                //Navigator.of(context).pop();
                              } else {
                                showToast(
                                    context, 'Bạn hãy nhập đủ hết thông tin');
                              }
                              String maNguoiDung =
                                  await SharedPreferencesService.getId() ?? '';
                              context
                                  .read<MainBloc>()
                                  .add(ProfileEvent(id: maNguoiDung));
                              Navigator.pop(context);
                              await SynchronizedRepository()
                                  .syncAll(connected: connected);
                            },
                            style: ButtonStyle(
                              // overlayColor: const MaterialStatePropertyAll(
                              //     Colors.transparent),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38),
                              )),
                              elevation: MaterialStateProperty.all(0),
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                  size.width,
                                  size.height * 0.075,
                                ),
                              ),
                              textStyle: MaterialStateProperty.all(
                                PrimaryFont.semibold(16, FontWeight.w600)
                                    .copyWith(color: greyText),
                              ),
                            ),
                            child: Text(
                              'Cập nhật',
                            ),
                          );
                        },
                        child: const SizedBox(),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: FractionallySizedBox(
                      child: SizedBox(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
