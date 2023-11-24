import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/guide.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/link.dart';

class LinkProvider {
  final Dio _dio = Dio();

  // lấy links
  Future<List<Link>> getLink(int type) async {
    try {
      String link = linkGetConTrai;
      if (type == 2) {
        link = linkGetConGai;
      } else if (type == 3) {
        link = linkGetAnToan;
      } else if (type == 4) {
        link = linkGetMeBe;
      }
      String token = await SharedPreferencesService.getToken() ?? '';
      List<Link> listLink = [];
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(
        '$link',
      );
      if (response.statusCode == 200) {
        List x = response.data['data'];
        listLink = x.map((e) => Link.fromJson(jsonEncode(e))).toList();
      }
      return listLink;
    } catch (e) {
      throw 'Lỗi kết nối';
      //throw e;
    }
  }

  // lấy links video huong dan
  Future<List<Guide>?> getGuideVideos() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      List<Guide> listLink = [];
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(videoGuideGetVideo);
      if (response.statusCode == 200) {
        List x = response.data['data'];
        listLink = x.map((e) => Guide.fromJson(jsonEncode(e))).toList();
      }
      return listLink;
    } catch (e) {
      return null;
    }
  }

  // lấy links image huong dan
  Future<List<Guide>?> getGuideImages() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      List<Guide> listLink = [];
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(videoGuideGetImage);
      if (response.statusCode == 200) {
        List x = response.data['data'];
        listLink = x.map((e) => Guide.fromJson(jsonEncode(e))).toList();
      }
      return listLink;
    } catch (e) {
      return null;
    }
  }

  // lay link file mp3 bu me
  Future<Guide?> getGuideBuMe() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(videoGetBuMe);
      if (response.statusCode == 200) {
        List x = response.data['data'];
        return Guide.fromJson(jsonEncode(x.first));
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
