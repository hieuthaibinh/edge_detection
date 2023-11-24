import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';

class UpgradeApi {
  final Dio _dio = Dio();

  Future<int?> getLastestVersion() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(versionGet);
      if (response.statusCode == 200) {
        return response.data['version_id']; 
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
