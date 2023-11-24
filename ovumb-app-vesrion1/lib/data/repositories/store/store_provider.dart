import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_ovumb_app_version1/data/api_url/api_url.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product_category.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/store_slider.dart';

class StoreProvider {
  final Dio _dio = Dio();

  //get all sp
  Future<List<Product>> getProductByListId(
      List<LocalProduct> localProduct) async {
    try {
      List<int> listId =
          localProduct.map((product) => product.maSanPham).toList();
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(
        '$sanphamGetAllByListId',
        data: {'data': listId},
      );
      List<Product> products = [];
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          List data = response.data['data'];
          products = data.map((e) => Product.fromJson(jsonEncode(e))).toList();
        }
      }
      return products;
    } catch (e) {
      throw e;
    }
  }

  //get all sp
  Future<List<Product>?> getAllProduct(int category) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$sanphamGetLimit/$category');
      List<Product> products = [];
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          List data = response.data['data'];
          products = data.map((e) => Product.fromJson(jsonEncode(e))).toList();
        }
      }
      return products;
    } catch (e) {
      return null;
    }
  }

  //get limit sp
  Future<List<ProductCategory>?> getLimitProduct(int phase) async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$sanphamGetLimit/$phase');
      List<ProductCategory> products = [];
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          List data = response.data['data'];
          products =
              data.map((e) => ProductCategory.fromJson(jsonEncode(e))).toList();
        }
      }
      return products;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //get slider
  Future<List<StoreSlider>?> getSliders() async {
    try {
      String token = await SharedPreferencesService.getToken() ?? '';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('$sildeGet');
      List<StoreSlider> sliders = [];
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          List data = response.data['data'];
          sliders =
              data.map((e) => StoreSlider.fromJson(jsonEncode(e))).toList();
        }
      }
      return sliders;
    } catch (e) {
      return null;
    }
  }
}
