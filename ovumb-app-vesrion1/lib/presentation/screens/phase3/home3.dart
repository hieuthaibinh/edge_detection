// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/constant/bmi_baby.dart';
import 'package:flutter_ovumb_app_version1/data/model_phattrien.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/trieuchung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_state.dart';
import 'package:flutter_ovumb_app_version1/logic/upgrade/upgrade_logic.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3_disconnect.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/kichsua/kich_sua_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/suckhoe.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/thongtin.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/thongtin_update.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/widgets/home3_button.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/widgets/home3_container.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/widgets/home3_rectangle.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/home3_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/remove_baby_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/home3_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';
import 'package:flutter_ovumb_app_version1/data/model_home3.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/home/home_full_container.dart';

class Home3 extends StatefulWidget {
  static const routeName = 'home3-screen';
  const Home3({
    Key? key,
  }) : super(key: key);

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  MilkRepository _milkRepository = MilkRepository();
  int countDown = 0;

  @override
  void initState() {
    UpgraderLogic().checkVersion(context: context, dayNextRequest: 2);
    context.read<MilkBloc>().add(CheckBabyExistEvent());
    super.initState();
  }

  String _buildBMItext(Con con, PhatTrienCon? phatTrienCon) {
    if (phatTrienCon != null) {
      if (phatTrienCon.canNang != null && phatTrienCon.chieuCao != null) {
        int index = BMIBaby.evaluateBMI(
            con,
            BMIBaby.calculateBMI(
                phatTrienCon.canNang!, phatTrienCon.chieuCao!));
        return dataPhatTrienChiTiet[index].thetrang;
      }
    }
    return '- - - - -';
  }

  String _buildChoAntext(List<ChoAn> choAn) {
    double totalGam = 0;
    double totalMl = 0;
    choAn.forEach((e) {
      if (e.maLoaiChoAn != 4) {
        totalMl += e.trongLuong;
      } else {
        totalGam += e.trongLuong;
      }
    });

    return '${totalMl.round()}ml-${totalGam.round()}gam';
  }

  String _buildTrieuChungtext(TrieuChung? trieuChung) {
    if (trieuChung == null) return '- - - - -';
    return trieuChung.dauHieu!.split(';')[0];
  }

  void _callBackBloc() {
    context.read<MilkBloc>().add(CheckBabyExistEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (countDown == 1) {
          countDown = 0;
          SystemNavigator.pop();
        } else {
          showToast(context, 'Ấn lần nữa để THOÁT');
          countDown++;
        }
        Future.delayed(Duration(seconds: 2), () {
          countDown = 0;
        });
        return false;
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              SizedBox(
                height: size.height * 0.3,
                child: Image.asset(
                  'assets/images/bg_phase4.png',
                  fit: BoxFit.cover,
                ),
              ),
              Scaffold(
                key: scaffoldKey,
                endDrawer: Home3Drawer(
                  size: size,
                  scaffoldKey: scaffoldKey,
                ),
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () =>
                          scaffoldKey.currentState!.openEndDrawer(),
                      icon: Image.asset(
                        'assets/buttons/menu.png',
                        scale: 3,
                        color: rose25,
                      ),
                    ),
                  ],
                ),
                body: BlocBuilder<MilkBloc, MilkState>(
                  builder: (context, state) {
                    if (state is BabyExistState) {
                      Con con = state.con;
                      PhatTrienCon? phatTrienCon = state.phatTrienCon.isNotEmpty
                          ? state.phatTrienCon.first
                          : null;
                      TrieuChung? trieuChung = state.trieuChung.isNotEmpty
                          ? state.trieuChung.first
                          : null;

                      return Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          right: 0,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    height: 92,
                                    width: size.width,
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                            color: rose100,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(color: rose300),
                                          ),
                                          child: Image.asset(
                                              'assets/images/avatar.png'),
                                        ),
                                        SizedBox(width: size.width * 0.03),
                                        SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                width: size.width * 0.58,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TitleText(
                                                      text: con.ten,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      size: 18,
                                                      color: whiteColor,
                                                    ),
                                                    IconButton(
                                                      icon: Image.asset(
                                                        'assets/images/pen.png',
                                                        scale: 2,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          ThongTinUpdate
                                                              .routeName,
                                                          arguments: con,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                //color: Colors.blue,
                                                height: 62,
                                                width: size.width * 0.58,
                                                child: Row(
                                                  children: [
                                                    Home3Rectangle(
                                                      title:
                                                          home3Infor[0].title,
                                                      text: phatTrienCon != null
                                                          ? phatTrienCon
                                                              .chieuCao
                                                          : null,
                                                      subText:
                                                          home3Infor[0].detail,
                                                    ),
                                                    Home3Rectangle(
                                                      title:
                                                          home3Infor[1].title,
                                                      text: phatTrienCon != null
                                                          ? phatTrienCon.canNang
                                                          : null,
                                                      subText:
                                                          home3Infor[1].detail,
                                                    ),
                                                    Home3Rectangle(
                                                      title:
                                                          home3Infor[2].title,
                                                      text: con.gioiTinh,
                                                      subText: '',
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
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    alignment: Alignment.center,
                                    height: 160,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 12,
                                          offset: Offset(1, 5),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  SucKhoe.routeName,
                                                  arguments: {
                                                    'con': con,
                                                    'phatTrienCon':
                                                        state.phatTrienCon,
                                                    'index': 0,
                                                    'trieuChung': trieuChung,
                                                  },
                                                );
                                              },
                                              child: Home3Button(
                                                image: home3List[0].image,
                                                title: home3List[0].title,
                                                subTitle: _buildChoAntext(
                                                    state.choAn),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                SucKhoe.routeName,
                                                arguments: {
                                                  'con': con,
                                                  'phatTrienCon':
                                                      state.phatTrienCon,
                                                  'index': 1,
                                                  'trieuChung': trieuChung,
                                                },
                                              );
                                            },
                                            child: Home3Button(
                                              image: home3List[1].image,
                                              title: home3List[1].title,
                                              subTitle: _buildBMItext(
                                                  con, phatTrienCon),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                SucKhoe.routeName,
                                                arguments: {
                                                  'con': con,
                                                  'phatTrienCon':
                                                      state.phatTrienCon,
                                                  'index': 2,
                                                  'trieuChung': trieuChung,
                                                },
                                              );
                                            },
                                            child: Home3Button(
                                              image: home3List[2].image,
                                              title: home3List[2].title,
                                              subTitle: _buildTrieuChungtext(
                                                  trieuChung),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Container(
                                    height: 230,
                                    width: size.width,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 24, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Home3Container(
                                          callback: () => Navigator.pushNamed(
                                            context,
                                            KichSuaScreen.routeName,
                                            arguments: con,
                                          ),
                                          image: home3Box[1].image,
                                          widget: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tính năng',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                'Hành trình kích sữa',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                'Bổ sung lượng sữa hút của mẹ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          button: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: rose50,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TitleText(
                                                  text: 'Bắt đầu ',
                                                  fontWeight: FontWeight.w600,
                                                  size: 14,
                                                  color: rose400,
                                                ),
                                                Image.asset(
                                                  'assets/icons/next_icon.png',
                                                  scale: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 24),
                                        Home3Container(
                                          image: home3Box[0].image,
                                          widget: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tính năng',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                'Kiểm tra chất lượng sữa',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                'Đang được \nphát triển',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          button: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: rose50,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TitleText(
                                                  text: 'Đang khóa ',
                                                  fontWeight: FontWeight.w600,
                                                  size: 14,
                                                  color: Color(0xffFE7347),
                                                ),
                                                Image.asset(
                                                  'assets/images/lock.png',
                                                  scale: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: HomeFullContainer(
                                        image: 'assets/images/sua.png',
                                        title: 'Tham gia hội sữa',
                                        sub:
                                            'Tham khảo các kiến thức chăm sóc mẹ bé',
                                        textColor: rose400,
                                        fromColor: Colors.white,
                                        toColor: Colors.white,
                                        directFrom: Alignment.bottomCenter,
                                        directTo: Alignment.topCenter,
                                        shadow: BoxShadow(
                                          color: grey200.withOpacity(0.7),
                                          blurRadius: 10,
                                          spreadRadius: 3,
                                          offset: Offset(0, 2),
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      await LaunchUrl.web(
                                        context: context,
                                        maLink: maKichSua,
                                        tenLink: linkKichSua,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 50),
                                  IconButton(
                                    icon: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/trash.png',
                                          scale: 3,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Xóa thông tin bé',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: rose500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () async {
                                      bool? check = await removeBabyDialog(
                                          context, con.ten);
                                      if (check == true) {
                                        LoadingLogo().show(context: context);
                                        bool checkDelete = await _milkRepository
                                            .delete(id: con.id);
                                        LoadingLogo().hide();
                                        if (checkDelete) {
                                          showToast(context,
                                              'Thông tin của bé ${con.ten} đã được xóa thành công',
                                              seconds: 3);
                                          context
                                              .read<MilkBloc>()
                                              .add(CheckBabyExistEvent());
                                        } else {
                                          showToast(context,
                                              'Thông tin của bé xóa không thành công. Vui lòng kiểm tra lại kết nối mạng',
                                              seconds: 3);
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(height: 100),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is LoadingFailureState) {
                      return Home3DisconnectScreen(callback: _callBackBloc);
                    } else if (state is BabyNotExistState) {
                      return ThongTin(
                        isAdd: state.isAdd,
                      );
                    }
                    return getShimmer(Home3Shimmer());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
