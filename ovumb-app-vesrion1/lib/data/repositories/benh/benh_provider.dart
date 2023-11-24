import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';

// {} []
class BenhProvider {
  final Dio _dio = Dio();

  Future<bool> insertBenh(
    String tenBenh,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$tenBenh',
        data: {
          'tenBenh': tenBenh,
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

  Future<bool> updateBenh(
    String tenBenh,
    String id,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$tenBenh/$id',
        data: {
          'tenBenh': tenBenh,
          'id': id,
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

   Future<bool> deleteBenh(
    String tenBenh,
    String id,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(
        '$tenBenh/$id',
        data: {
          'tenBenh': tenBenh,
          'id': id,
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

   Future<bool> getBenh(
    String tenBenh,
    String id,
  ) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(
        '$tenBenh/$id',
        data: {
          'tenBenh': tenBenh,
          'id': id,
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
