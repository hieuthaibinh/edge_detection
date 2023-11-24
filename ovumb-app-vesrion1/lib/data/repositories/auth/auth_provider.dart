import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';

class AuthProvider {
  final Dio _dio = Dio();
  final LocalRepository _localRepository = LocalRepository();

  // đăng kí
  Future<bool> register(
    String taiKhoan,
    String matKhau,
    String tenNguoiDung,
    String email,
    String namSinh,
  ) async {
    try {
      final response = await _dio.post(
        authRegister,
        data: {
          'taiKhoan': taiKhoan,
          'matKhau': matKhau,
          'tenNguoiDung': tenNguoiDung,
          'email': email,
          'namSinh': namSinh,
          'ngayTao': DateTime.now().millisecondsSinceEpoch,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw 'Lỗi kết nối mạng';
      } else if (e.response!.statusCode == 500) {
        throw 'Hệ thống đang bảo trì. Vui lòng thử lại sau';
      } else {
        throw e.response!.data['message'];
      }
    }
  }

  // đăng nhập
  Future<bool> login(String taiKhoan, String matKhau) async {
    try {
      final response = await _dio.post(
        authLogin,
        data: {
          'taiKhoan': taiKhoan,
          'matKhau': matKhau,
        },
      );
      if (response.statusCode == 200) {
        //lưu token và mã người dùng của người dùng
        await SharedPreferencesService.setToken(response.data['token']);
        await SharedPreferencesService.setId(
            response.data['nguoidung']['maNguoiDung']);

        //lưu người dùng vào local
        await _localRepository.insertNguoiDung(
            NguoiDung.fromJson(jsonEncode(response.data['nguoidung'])));
        return true;
      }

      return false;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw 'Lỗi kết nối mạng';
      } else if (e.response!.statusCode == 500) {
        throw 'Hệ thống đang bảo trì. Vui lòng thử lại sau';
      } else {
        throw e.response!.data['message'];
      }
    }
  }

  // đăng xuất
  Future<bool> logout(String token) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(authLogout);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // reset password
  Future<bool> resetPassword(
    String email,
  ) async {
    try {
      final response = await _dio.post(
        '$mailResetPassword',
        data: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      throw e;
    }
  }

  // change password
  Future<bool> changePassword(
    String matKhau,
    String matKhauMoi,
    String password_confirmation,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$authResetPassword/$maNguoiDung',
        data: {
          'matKhau': matKhau,
          'matKhauMoi': matKhauMoi,
          'password_confirmation': password_confirmation,
        },
      );
      if (response.statusCode == 200) {
        return response.data['status'];
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
