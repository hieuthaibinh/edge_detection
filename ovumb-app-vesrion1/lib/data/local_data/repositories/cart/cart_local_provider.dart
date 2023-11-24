import 'dart:convert';

import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/cart/cart_local.dart';

class CartLocalProvider {
  static final CartLocalProvider _instance = CartLocalProvider._internal();
  factory CartLocalProvider() {
    return _instance;
  }
  CartLocalProvider._internal();
  final dbProvider = DatabaseProvider.db;

  //insert item to cart
  Future<bool> insertItem(
    CartModel cartModel,
  ) async {
    try {
      final db = await dbProvider.database;
      String maNguoiDung = await SharedPreferencesService.getId() ?? '';
      final product = await db.query(
        tableProduct,
        where: 'maNguoiDung = ? AND maSanPham = ?',
        whereArgs: [maNguoiDung, cartModel.maSanPham],
      );

      //if exists, update quantity, not exists is insert item
      if (product.isNotEmpty) {
        CartModel cart = CartModel.fromJson(jsonEncode(product));
        await updateQuantity(
            cartModel.maSanPham, cart.soLuong + cartModel.soLuong);
      } else {
        await db.insert(
          tableProduct,
          jsonDecode(cartModel.toJson()),
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  // update quantity of item in cart
  Future<bool> updateQuantity(
    int maSanPham,
    int soLuong,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableProduct,
        {
          'soLuong': soLuong,
        },
        where: 'maSanPham = ?',
        whereArgs: [maSanPham],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //delete item
  Future<bool> deleteItem(
    int maSanPham,
  ) async {
    try {
      final db = await dbProvider.database;
      await db.delete(
        tableProduct,
        where: 'maSanPham = ?',
        whereArgs: [maSanPham],
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
