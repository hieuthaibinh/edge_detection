import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/model_dangky.dart';
import 'package:flutter_ovumb_app_version1/data/validator/register_validator.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/login_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_policy.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_scroll_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register-screen';
  final int widgetId;
  const RegisterScreen({
    super.key,
    required this.widgetId,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController controller;
  late Animation<double> animation;
  bool isVerify = false;

  List<TextEditingController> _listController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final myController = TextEditingController();

  bool isClick = false;
  Widget loginPage = LoginScreen(widgetId: 0);
  // [] {}

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, // nhớ thêm with TickerProviderStateMixin vào phần đầu class
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    myController.dispose();
    _listController[0].dispose();
    _listController[1].dispose();
    _listController[2].dispose();
    _listController[3].dispose();
    _listController[4].dispose();
    _listController[5].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        ////////////////
        ///title appBar
        centerTitle: true,
        title: Text(
          'Đăng ký',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff344054),
            fontSize: 18,
            decoration: TextDecoration.none,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(
          decoration: BoxDecoration(
              //color: Colors.blue,
              ),
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: Image.asset('assets/icons/back_button.png'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
              //}
            },
          ),
        ),
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: Image.asset(
                    dataDangky[2].imageAsset,
                    scale: 2,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RegisterInput(
                      name: 'Họ và tên',
                      iconUrl: 'assets/icons/user_unactive.png',
                      controller: _listController[0],
                      isClick: isClick,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    RegisterInput(
                      name: 'Số điện thoại',
                      iconUrl: 'assets/icons/phone_icon.png',
                      controller: _listController[1],
                      isClick: isClick,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    RegisterInput(
                      name: 'Email',
                      iconUrl: 'assets/icons/email_icon.png',
                      controller: _listController[2],
                      isClick: isClick,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    RegisterScrollInput(
                      name: 'Năm sinh',
                      iconUrl: 'assets/icons/calendar_icon.png',
                      controller: _listController[3],
                      isClick: false,
                      enabled: true,
                      beginNumber: DateTime.now()
                          .subtract(Duration(days: 12 * 30 * 60))
                          .year,
                      endNumber: DateTime.now().year,
                    ),
                    const SizedBox(height: 20),
                    RegisterInput(
                      name: 'Mật khẩu mới',
                      iconUrl: 'assets/icons/lockgrey.png',
                      controller: _listController[4],
                      isClick: isClick,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    RegisterInput(
                      name: 'Xác nhận mật khẩu',
                      iconUrl: 'assets/icons/lockgrey.png',
                      controller: _listController[5],
                      isClick: isClick,
                      isPassword: true,
                    ),
                  ],
                ),
                //button
                const SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        isVerify = !isVerify;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Image.asset(
                            isVerify
                                ? 'assets/icons/checkmark_checked.png'
                                : 'assets/icons/checkmark_uncheck.png',
                            scale: 3.5,
                          ),
                          const SizedBox(width: 10),
                          TitleText(
                            text: 'Tôi đồng ý với ',
                            fontWeight: FontWeight.w600,
                            size: 14,
                            color: grey500,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        RegisterPolicyWebview.routeName,
                        arguments: linkPolicy,
                      ),
                      child: Text(
                        'Chính sách & Bảo mật',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: rose500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
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
                    ],
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                      fixedSize: MaterialStatePropertyAll(
                        Size(
                          screenSize.width * 0.9,
                          screenSize.height * 0.065,
                        ),
                      ),
                    ),
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      String? validate = registerValidator(_listController);
                      // validate == null là đã validate thành công
                      if (validate == null) {
                        if (isVerify) {
                          context.read<AuthBloc>().add(
                                AuthEventRegister(
                                  taiKhoan: _listController[1].text,
                                  matKhau: _listController[4].text,
                                  tenNguoiDung: _listController[0].text.trim(),
                                  email: _listController[2].text.trim(),
                                  namSinh: _listController[3].text.trim(),
                                ),
                              );
                        } else {
                          showToast(context,
                              'Vui lòng xác nhận đồng ý với chính xác & bảo mật');
                        }
                      } else {
                        showToast(context, validate);
                      }
                      //}
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
