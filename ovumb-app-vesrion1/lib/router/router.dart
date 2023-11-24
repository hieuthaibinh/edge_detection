import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/guide.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/quan_ly_que_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_webview.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/chart/chart_history_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/chart/chart_landscape_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/chart/chart_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/group/group_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/man_huong_dan/image_analyze_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/man_huong_dan/man_huong_dan_test_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/logo_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/password/change_password_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/ngaydusinh_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/overall_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/password/forget_password_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/phase2_initial_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/phase2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/baby_add_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/kichsua/kich_sua_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/kichsua/kich_sua_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/nav_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/suckhoe.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/thongtin.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/thongtin_update.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/product/product_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/qrcode/qrcode.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_policy.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/register/register_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/FAQ/faq_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/choose_home_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/home_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/profile/profile_edit_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/reminder/reminder_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/nhat_ky/nhat_ky_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/login_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/logged_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/welcome_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question1_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question4_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question5_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_update_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_cart_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/main_store_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/product/store_product_item_detail.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_added_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_error_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_initial_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_manage_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_que_webview.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_result_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_select_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/canh_bao_cham_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/giao_duc_gioi_tinh_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan3_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan5_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/animations/slide_left_route.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LogoScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => LogoScreen(),
      );
    case LoggedScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => LoggedScreen(),
      );
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnboardingScreen(
          isCheck: true,
        ),
      );
    case NhatkyScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final listCauHoi = arguments['listCauHoi'];
      final nguoiDung = arguments['nguoiDung'];
      final date = arguments['date'];
      final luongKinh = arguments['luongKinh'];
      final listCauTraLoi = arguments['listCauTraLoi'];
      final listCalendar = arguments['listCalendar'];
      return MaterialPageRoute(
        builder: (context) => NhatkyScreen(
          titleId: 0,
          listCauHoi: listCauHoi,
          nguoiDung: nguoiDung,
          date: date,
          luongKinh: luongKinh,
          listCauTraLoi: listCauTraLoi,
          listCalendar: listCalendar,
        ),
      );
    case QuestionMainScreen.routeName:
      final phase = settings.arguments as int;
      return SlideLeftRoute(
        page: QuestionMainScreen(phase: phase),
      );
    case QuestionUpdateScreen.routeName:
      final kinhNguyet = settings.arguments as KinhNguyet;
      return SlideLeftRoute(
        page: QuestionUpdateScreen(
          kinhNguyet: kinhNguyet,
        ),
      );
    case Question1Screen.routeName:
      return SlideLeftRoute(
        page: const Question1Screen(),
      );
    case Question2Screen.routeName:
      TextEditingController question2 = TextEditingController();
      TextEditingController question3 = TextEditingController();
      final isUpdate = settings.arguments as bool;
      return SlideLeftRoute(
        page: Question2Screen(
          question2: question2,
          question3: question3,
          isUpdate: isUpdate,
        ),
      );
    // case Question3Screen.routeName:
    //   return SlideLeftRoute(
    //     page: const Question3Screen(),
    //   );
    case Question4Screen.routeName:
      return SlideLeftRoute(
        page: const Question4Screen(),
      );
    case Question5Screen.routeName:
      return SlideLeftRoute(
        page: const Question5Screen(),
      );
    case MainScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final nguoiDung = arguments['nguoiDung'];
      final int? tbnkn = arguments['tbnkn'];
      return MaterialPageRoute(
        builder: (context) => MainScreen(
          nguoiDung: nguoiDung,
          tbnkn: tbnkn,
        ),
      );
    case HomeScreen.routeName:
      final phase = settings.arguments as int;
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: HomeScreen(phase: phase),
        ),
      );
    case TestResultScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final maQuanLyQueTest = arguments['maQuanLyQueTest'];
      final maLoaiQue = arguments['maLoaiQue'];
      final isError = arguments['isError'];
      final lh = arguments['lh'];
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: TestResultScreen(
            lh: lh,
            isError: isError,
            maQuanLyQueTest: maQuanLyQueTest,
            maLoaiQue: maLoaiQue,
          ),
        ),
      );
    case TestAddedScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: TestAddedScreen(),
        ),
      );
    case TestErrorScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: TestErrorScreen(),
        ),
      );
    case TestSelectScreen.routeName:
      final quanLyQueTest = settings.arguments as QuanLyQueTest;
      final videos = settings.arguments as List<Guide>;
      final images = settings.arguments as List<Guide>;
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: TestSelectScreen(
            quanLyQueTest: quanLyQueTest,
            images: images,
            videos: videos,
          ),
        ),
      );
    case ImageAnalyzeScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final maQuanLyQueTest = arguments['maQuanLyQueTest'];
      final maLoaiQue = arguments['maLoaiQue'];
      final videos = arguments['videos'];
      final images = arguments['images'];
      return SlideLeftRoute(
        page: ImageAnalyzeScreen(
          maQuanLyQueTest: maQuanLyQueTest,
          maLoaiQue: maLoaiQue,
          videos: videos,
          images: images,
        ),
      );

    case ManHuongDanTestScreen.routeName:
      return SlideLeftRoute(
        page: ManHuongDanTestScreen(),
      );
    case ForgetPasswordScreen.routeName:
      return SlideLeftRoute(
        page: ForgetPasswordScreen(),
      );
    case QRCodeScreen.routeName:
      return SlideLeftRoute(
        page: QRCodeScreen(),
      );
    case WelcomeScreen.routeName:
      return SlideLeftRoute(
        page: WelcomeScreen(),
      );
    case ReminderScreen.routeName:
      return SlideLeftRoute(
        page: const ReminderScreen(),
      );
    case FAQScreen.routeName:
      return SlideLeftRoute(
        page: FAQScreen(),
      );
    case ProfileEditScreen.routeName:
      final nguoiDung = settings.arguments as NguoiDung;
      return SlideLeftRoute(
        page: ProfileEditScreen(
          nguoiDung: nguoiDung,
        ),
      );
    case ChooseHomeScreen.routeName:
      return SlideLeftRoute(
        page: ChooseHomeScreen(),
      );
    case ChangePasswordScreen.routeName:
      return SlideLeftRoute(
        page: const ChangePasswordScreen(),
      );
    case Tuvan2Screen.routeName:
      final phase = settings.arguments as int;
      return SlideLeftRoute(
        page: Tuvan2Screen(phase: phase),
      );
    case Tuvan3Screen.routeName:
      return SlideLeftRoute(
        page: const Tuvan3Screen(widgetId: 0),
      );
    case Tuvan5Screen.routeName:
      final tvv = settings.arguments as TVV;
      return SlideLeftRoute(
        page: Tuvan5Screen(tvv: tvv),
      );
    case ChartLandscapeScreen.routeName:
      final chartData = settings.arguments as List<ChartData>;
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: ChartLandscapeScreen(
            chartData: chartData,
          ),
        ),
      );
    case ChartHistoryScreen.routeName:
      final ketQuaTest = settings.arguments as List<KetQuaTest>;
      return SlideLeftRoute(
        page: ChartHistoryScreen(
          listKetQuaTest: ketQuaTest,
        ),
      );
    case RegisterScreen.routeName:
      return SlideLeftRoute(
        page: const RegisterScreen(widgetId: 0),
      );
    case LoginScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final taiKhoan = arguments['taiKhoan'];
      final matKhau = arguments['matKhau'];
      return SlideLeftRoute(
        page: LoginScreen(
          taiKhoan: taiKhoan,
          matKhau: matKhau,
          widgetId: 0,
        ),
      );
    case TestInitialScreen.routeName:
      return SlideLeftRoute(
        page: const TestInitialScreen(),
      );
    case TestManageScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: TestManageScreen(),
        ),
        settings: RouteSettings(name: TestManageScreen.routeName),
      );
    case GroupScreen.routeName:
      final maNguoiDung = settings.arguments as String;

      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: GroupScreen(maNguoiDung: maNguoiDung),
        ),
        settings: RouteSettings(name: GroupScreen.routeName),
      );
    case NgayDuSinhScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final maNguoiDung = arguments['maNguoiDung'];
      final DateTime? ngayDuSinh = arguments['ngayDuSinh'];
      final phase = arguments['phase'];
      return SlideLeftRoute(
        page: NgayDuSinhScreen(
          widgetId: 0,
          maNguoiDung: maNguoiDung,
          ngayDuSinh: ngayDuSinh,
          phase: phase,
        ),
      );
    case Phase2Screen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final nguoiDung = arguments['nguoiDung'];
      final phase = arguments['phase'];
      return MaterialPageRoute(
        builder: (context) => Phase2Screen(
          nguoiDung: nguoiDung,
          phase: phase,
        ),
      );
    case Phase2InitialScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final int? phase = arguments['phase'];
      return SlideLeftRoute(
        page: Phase2InitialScreen(phase: phase),
      );
    case BlogScreen.routeName:
      final phase = settings.arguments as int;
      return SlideLeftRoute(
        page: BlogScreen(phase: phase),
      );
    case OverallScreen.routeName:
      final ngayDuSinh = settings.arguments as DateTime;
      return SlideLeftRoute(
        page: OverallScreen(
          widgetId: 0,
          ngayDuSinh: ngayDuSinh,
        ),
      );
    case BlogScreen.routeName:
      final phase = settings.arguments as int;
      return SlideLeftRoute(
        page: BlogScreen(phase: phase),
      );
    case BlogWebView.routeName:
      final url = settings.arguments as String;
      return SlideLeftRoute(
        page: BlogWebView(
          url: url,
        ),
      );
    case TestQueWebView.routeName:
      final url = settings.arguments as String;
      return SlideLeftRoute(
        page: TestQueWebView(
          url: url,
        ),
      );
    case Home3.routeName:
      return SlideLeftRoute(
        page: Home3(),
      );
    case ThongTin.routeName:
      return SlideLeftRoute(
        page: ThongTin(),
      );
    case ThongTinUpdate.routeName:
      final con = settings.arguments as Con;
      return SlideLeftRoute(
        page: ThongTinUpdate(con: con),
      );
    case BabyAddScreen.routeName:
      return SlideLeftRoute(
        page: BabyAddScreen(),
      );
    case SucKhoe.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final con = arguments['con'];
      final phatTrienCon = arguments['phatTrienCon'];
      final index = arguments['index'];
      final trieuChung = arguments['trieuChung'];
      return MaterialPageRoute(
        builder: (context) => SucKhoe(
          con: con,
          phatTrienCon: phatTrienCon,
          index: index,
          trieuChung: trieuChung,
        ),
      );
    case NavScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final widgetId = arguments['widgetId'];
      final clickId = arguments['clickId'];
      final count = arguments['count'];
      final con = arguments['con'];
      return MaterialPageRoute(
        builder: (context) => NavScreen(
          widgetId: widgetId,
          clickId: clickId,
          count: count,
          con: con,
        ),
      );
    case KichSuaScreen.routeName:
      final con = settings.arguments as Con;
      return MaterialPageRoute(
        builder: (context) => KichSuaScreen(con: con),
      );
    case KichSuaInput.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final con = arguments['con'];
      final count = arguments['count'];
      return MaterialPageRoute(
        builder: (context) => KichSuaInput(
          count: count,
          con: con,
        ),
      );

    case RegisterPolicyWebview.routeName:
      final url = settings.arguments as String;
      return SlideLeftRoute(
        page: RegisterPolicyWebview(
          url: url,
        ),
      );
    case CanhBaoChamScreen.routeName:
      final currentIndex = settings.arguments as int;
      return SlideLeftRoute(
        page: CanhBaoChamScreen(currentIndex: currentIndex),
      );
    case GiaoDucGioiTinhScreen.routeName:
      final maNguoiDung = settings.arguments as String;
      return SlideLeftRoute(
        page: GiaoDucGioiTinhScreen(maNguoiDung: maNguoiDung),
      );
    case ProductScreen.routeName:
      final title = settings.arguments as String;
      return SlideLeftRoute(
        page: ProductScreen(appbarTitle: title),
      );
    case MainStoreScreen.routeName:
      return SlideLeftRoute(
        page: MainStoreScreen(),
      );
    case StoreProductItemDetail.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final product = arguments['product'];
      final type = arguments['type'];
      return SlideLeftRoute(
        page: StoreProductItemDetail(product: product, type: type,),
      );
    case StoreCartScreen.routeName:
      return SlideLeftRoute(
        page: StoreCartScreen(),
      );
    default:
      final nguoiDung = settings.arguments as NguoiDung;
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: MainScreen(nguoiDung: nguoiDung),
        ),
      );
  }
}
