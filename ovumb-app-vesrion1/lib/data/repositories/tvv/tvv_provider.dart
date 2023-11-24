import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';

class TvvProvider {
  final Dio _dio = Dio();

  // lấy tư vấn viên theo user
  Future<List<TVV>> getListTvvByUser(int type) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      List<TVV> listTvv = [];
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(
        '$tvvGetbyUser/$maNguoiDung/$type',
      );
      if (response.statusCode == 200) {
        List x = response.data['data'];
        if (x.isEmpty) {
          final res = await _dio.get(
            '$tvvGetAll/$type',
          );
          if (res.statusCode == 200) {
            x = res.data['data'];
            listTvv = x.map((e) => TVV.fromJson(jsonEncode(e))).toList();
          }
        } else {
          listTvv = x.map((e) => TVV.fromJson(jsonEncode(e))).toList();
        }
      }
      return listTvv;
    } catch (e) {
      throw 'Lỗi kết nối';
      //throw e;
    }
  }
}
