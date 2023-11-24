import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _singleton =
      SharedPreferencesService._internal();
  static SharedPreferences? _preferences;

  factory SharedPreferencesService() {
    return _singleton;
  }

  SharedPreferencesService._internal();

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception("SharedPreferences have not been initialized yet.");
    }
    return _preferences!;
  }

  //mã người dùng
  static Future<void> setId(String maNguoiDung) async {
    await _preferences?.setString('maNguoiDung', maNguoiDung);
  }

  static Future<String?> getId() async {
    return await _preferences?.getString('maNguoiDung');
  }

  static Future<void> removeId() async {
    await _preferences?.remove('maNguoiDung');
  }

  // token
  static Future<void> setToken(String token) async {
    await _preferences?.setString('token', token);
  }

  static Future<String?> getToken() async {
    return await _preferences?.getString('token');
  }

  static Future<void> removeToken() async {
    await _preferences?.remove('token');
  }

  // check đồng bộ
  static Future<void> setSync(bool sync) async {
    await _preferences?.setBool('sync', sync);
  }

  static Future<bool?> getSync() async {
    return await _preferences?.getBool('sync');
  }

  static Future<void> removeSync() async {
    await _preferences?.remove('sync');
  }

  // check showcase
  static Future<void> setShowCaseView(bool showcaseview) async {
    await _preferences?.setBool('showcaseview', showcaseview);
  }

  static Future<bool?> getShowCaseView() async {
    return await _preferences?.getBool('showcaseview');
  }

  // check phase
  static Future<void> setPhase(int phase) async {
    await _preferences?.setInt('phase', phase);
  }

  static Future<int?> getPhase() async {
    return await _preferences?.getInt('phase');
  }

  static Future<void> removePhase() async {
    await _preferences?.remove('phase');
  }

  //ads
  // phase1
  static Future<void> setAds1(DateTime date) async {
    await _preferences?.setInt('date1', date.millisecondsSinceEpoch);
  }

  static Future<int?> getAds1() async {
    return await _preferences?.getInt('date1');
  }

  static Future<void> removeAds1() async {
    await _preferences?.remove('date1');
  }

  // phase2
  static Future<void> setAds2(DateTime date) async {
    await _preferences?.setInt('date2', date.millisecondsSinceEpoch);
  }

  static Future<int?> getAds2() async {
    return await _preferences?.getInt('date2');
  }

  static Future<void> removeAds2() async {
    await _preferences?.remove('date2');
  }

  // phase3
  static Future<void> setAds3(DateTime date) async {
    await _preferences?.setInt('date3', date.millisecondsSinceEpoch);
  }

  static Future<int?> getAds3() async {
    return await _preferences?.getInt('date3');
  }

  static Future<void> removeAds3() async {
    await _preferences?.remove('date3');
  }

  // call version
  static Future<void> setCallVersion(int date) async {
    await _preferences?.setInt('callVersion', date);
  }

  static Future<int?> getCallVersion() async {
    return await _preferences?.getInt('callVersion');
  }

  static Future<void> removeCallVersion() async {
    await _preferences?.remove('callVersion');
  }
}
