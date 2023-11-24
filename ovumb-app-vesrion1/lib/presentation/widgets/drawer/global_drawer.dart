// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/constant/choose_phase.dart';
import 'package:flutter_ovumb_app_version1/data/constant/constant.dart';
import 'package:flutter_ovumb_app_version1/data/enum/age_enum.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/logic/flow/flow_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/logo_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/password/change_password_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/phase2_initial_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/product/product_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan1_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/transfer_phase_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/gridview_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/modal_bottom_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

//drawer kéo ra kéo vào dùng cho mọi màn hình
class GlobalDrawer extends StatefulWidget {
  const GlobalDrawer({
    Key? key,
    required this.size,
    required this.scaffoldKey,
  }) : super(key: key);

  final Size size;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {
  ServerRepository _serverRepository = ServerRepository();
  NguoiDung? nguoiDung;

  @override
  void initState() {
    super.initState();
    getNguoiDung();
  }

  Future<NguoiDung> getNguoiDung() async {
    final id = await SharedPreferencesService.getId();
    nguoiDung = await LocalRepository().getNguoiDung(id!);
    return nguoiDung!;
  }

  bool checkPhase(int phase, int currentPhase) {
    return phase == currentPhase;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Drawer(
        width: widget.size.width * 0.8,
        backgroundColor: whiteColor,
        child: DrawerHeader(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: FutureBuilder<NguoiDung>(
            future: getNguoiDung(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Container(
                      height: 140,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            rose500,
                            rose400,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/logo_main.png',
                                  color: whiteColor,
                                  scale: 3,
                                ),
                                IconButton(
                                  onPressed: () => widget
                                      .scaffoldKey.currentState!
                                      .closeEndDrawer(),
                                  icon: Image.asset(
                                    'assets/icons/x_icon.png',
                                    scale: 3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TitleText(
                              text:
                                  'Xin chào,\n${snapshot.data!.tenNguoiDung} ',
                              fontWeight: FontWeight.w700,
                              size: 18,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (FlowLogic().checkAge(snapshot.data!.namSinh) ==
                        AgeEnum.adults) ...[
                      Container(
                        height: 220,
                        child: GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: 14 / 9,
                          padding: const EdgeInsets.all(24),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (snapshot.data!.phase! == 3) {
                                  showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(26),
                                      ),
                                    ),
                                    isScrollControlled: true,
                                    barrierColor: grey900.withOpacity(0.4),
                                    context: context,
                                    builder: (context) {
                                      return ModalBottomDrawer(
                                        maNguoiDung: snapshot.data!.maNguoiDung,
                                        phase: 1,
                                        title: TITILE_DRAWER_PHASE1,
                                      );
                                    },
                                  );
                                } else if (!checkPhase(
                                    1, snapshot.data!.phase!)) {
                                  final check = await transferPhaseDialog(
                                      context, TITILE_DRAWER_PHASE1);
                                  if (check == true) {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      MainScreen.routeName,
                                      (route) => false,
                                      arguments: {
                                        'nguoiDung': snapshot.data,
                                        'tbnkn': null,
                                      },
                                    );
                                    LocalRepository().updatePhase(1);
                                    _serverRepository.updatePhase(phase: 1);
                                  }
                                }
                              },
                              child: GridviewDrawer(
                                text1: choosePhase[0].title,
                                text2: choosePhase[0].subTitle,
                                imageUrl: 'assets/images/choose_image2.png',
                                fromColor: rose500,
                                toColor: rose400,
                                isSelected: checkPhase(1, nguoiDung!.phase!),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (snapshot.data!.phase! == 3) {
                                  showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(26),
                                      ),
                                    ),
                                    isScrollControlled: true,
                                    barrierColor: grey900.withOpacity(0.4),
                                    context: context,
                                    builder: (context) {
                                      return ModalBottomDrawer(
                                        maNguoiDung: snapshot.data!.maNguoiDung,
                                        phase: 2,
                                        title: TITILE_DRAWER_PHASE2,
                                      );
                                    },
                                  );
                                } else if (!checkPhase(
                                    2, snapshot.data!.phase!)) {
                                  final check = await transferPhaseDialog(
                                      context, TITILE_DRAWER_PHASE2);
                                  if (check == true) {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      MainScreen.routeName,
                                      (route) => false,
                                      arguments: {
                                        'nguoiDung': snapshot.data,
                                        'tbnkn': null,
                                      },
                                    );
                                    LocalRepository().updatePhase(2);
                                    _serverRepository.updatePhase(phase: 2);
                                  }
                                }
                              },
                              child: GridviewDrawer(
                                text1: choosePhase[1].title,
                                text2: choosePhase[1].subTitle,
                                imageUrl: 'assets/images/choose_image1.png',
                                fromColor: violet500,
                                toColor: violet400,
                                isSelected:
                                    checkPhase(2, snapshot.data!.phase!),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (snapshot.data!.phase! == 3) {
                                  showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(26),
                                      ),
                                    ),
                                    isScrollControlled: true,
                                    barrierColor: grey900.withOpacity(0.4),
                                    context: context,
                                    builder: (context) {
                                      return ModalBottomDrawer(
                                        maNguoiDung: snapshot.data!.maNguoiDung,
                                        phase: 4,
                                        title: TITILE_DRAWER_PHASE4,
                                      );
                                    },
                                  );
                                } else if (!checkPhase(
                                    4, snapshot.data!.phase!)) {
                                  final check = await transferPhaseDialog(
                                      context, TITILE_DRAWER_PHASE4);
                                  if (check == true) {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      Home3.routeName,
                                      (route) => false,
                                    );
                                    LocalRepository().updatePhase(4);
                                    _serverRepository.updatePhase(phase: 4);
                                  }
                                }
                              },
                              child: GridviewDrawer(
                                text1: choosePhase[2].title,
                                text2: choosePhase[2].subTitle,
                                imageUrl: 'assets/images/choose_image4.png',
                                fromColor: blue500,
                                toColor: blue300,
                                isSelected:
                                    checkPhase(4, snapshot.data!.phase!),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (!checkPhase(3, snapshot.data!.phase!)) {
                                  final check = await transferPhaseDialog(
                                      context, TITILE_DRAWER_PHASE3);
                                  if (check == true) {
                                    final id =
                                        await SharedPreferencesService.getId();
                                    final user = await LocalRepository()
                                        .getNguoiDung(id!);
                                    Navigator.pushNamed(
                                      context,
                                      Phase2InitialScreen.routeName,
                                      arguments: {
                                        'phase': user.phase,
                                      },
                                    );
                                    LocalRepository().updatePhase(3);
                                    _serverRepository.updatePhase(phase: 3);
                                  }
                                }
                              },
                              child: GridviewDrawer(
                                text1: choosePhase[3].title,
                                text2: choosePhase[3].subTitle,
                                imageUrl: 'assets/images/choose_image3.png',
                                fromColor: green500,
                                toColor: green300,
                                isSelected:
                                    checkPhase(3, snapshot.data!.phase!),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (FlowLogic().checkAge(snapshot.data!.namSinh) ==
                        AgeEnum.teenage) ...[
                      InkWell(
                        onTap: () async {
                          await LaunchUrl.web(
                            context: context,
                            tenLink: linkRenoil,
                            maLink: maRenoil,
                          );
                        },
                        child: Container(
                          child: Image.asset(
                            'assets/images/phase5_renoil.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ],
                    Container(
                      height: 200,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                            child: InkWell(
                              onTap: () async {
                                if (snapshot.data!.phase != 5) {
                                  final id =
                                      await SharedPreferencesService.getId();
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Tuvan1Screen(
                                        widgetId: 0,
                                        phase: nguoiDung!.phase!,
                                        maNguoiDung: id!,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(
                                    context,
                                    ProductScreen.routeName,
                                    arguments: 'Sản Phẩm Hỗ Trợ',
                                  );
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/drawer_medicine_icon.png',
                                        scale: 3,
                                      ),
                                      const SizedBox(width: 14),
                                      const TitleText(
                                        text: 'Sản phẩm hỗ trợ',
                                        fontWeight: FontWeight.w600,
                                        size: 14,
                                        color: rose400,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/icons/next_button.png',
                                    scale: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (snapshot.data!.phase != 5) ...[
                            InkWell(
                              onTap: () async {
                                Navigator.of(context).pop();
                                await LaunchUrl.web(
                                  context: context,
                                  maLink: maLinkOvumbCommunity,
                                  tenLink: linkOvumbCommunity,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/drawer_share_icon.png',
                                          scale: 3,
                                        ),
                                        const SizedBox(width: 14),
                                        const TitleText(
                                          text: 'Cộng đồng OvumB',
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: rose400,
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/icons/next_button.png',
                                      scale: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(
                                  context, ChangePasswordScreen.routeName);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/drawer_lock_icon.png',
                                        scale: 3,
                                      ),
                                      const SizedBox(width: 14),
                                      const TitleText(
                                        text: 'Thay đổi mật khẩu',
                                        fontWeight: FontWeight.w600,
                                        size: 14,
                                        color: rose400,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/icons/next_button.png',
                                    scale: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(26),
                              ),
                            ),
                            isScrollControlled: true,
                            barrierColor: grey900.withOpacity(0.4),
                            context: context,
                            builder: (context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
                                            text: 'Đăng Xuất',
                                            fontWeight: FontWeight.w700,
                                            size: 18,
                                            color: rose500,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 70),
                                            child: Text(
                                              'Bạn có chắc chắn đăng xuất khỏi tài khoản này không?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
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
                                                  borderRadius:
                                                      BorderRadius.circular(38),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.transparent),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              38),
                                                    )),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(0),
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(
                                                      Size(
                                                        screenSize.width * 0.4,
                                                        screenSize.height *
                                                            0.06,
                                                      ),
                                                    ),
                                                    //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                                                  ),
                                                  child: Text(
                                                    'Quay lại',
                                                    style: PrimaryFont.semibold(
                                                            16, FontWeight.w600)
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
                                                  borderRadius:
                                                      BorderRadius.circular(38),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    BlocProvider.of<AuthBloc>(
                                                            context)
                                                        .add(AuthEventLogout());
                                                    await Future.delayed(
                                                        Duration(
                                                            milliseconds: 300));
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            LogoScreen
                                                                .routeName,
                                                            (route) => false);
                                                  },
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.transparent),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              38),
                                                    )),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(0),
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(
                                                      Size(
                                                        screenSize.width * 0.4,
                                                        screenSize.height *
                                                            0.06,
                                                      ),
                                                    ),
                                                    //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                                                  ),
                                                  child: Text(
                                                    'Xác nhận',
                                                    style: PrimaryFont.semibold(
                                                            16, FontWeight.w600)
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
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/sign_out_icon.png',
                              scale: 3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Đăng xuất',
                              style: PrimaryFont.semibold(
                                14,
                                FontWeight.w600,
                              ).copyWith(
                                color: rose400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 100,
                    // ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
