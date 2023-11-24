import 'dart:async';
import 'dart:convert';

import 'package:flutter_ovumb_app_version1/data/local_data/database/constant.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/database/database.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/cart_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';

class LocalProductProvider {
  static final LocalProductProvider _instance =
      LocalProductProvider._internal();
  factory LocalProductProvider() {
    return _instance;
  }
  LocalProductProvider._internal();
  final dbProvider = DatabaseProvider.db;

  final StreamController<List<LocalProduct>> _stream =
      StreamController.broadcast();
  final StreamController<num> _streamTotal = StreamController.broadcast();
  final StreamController<CartProduct?> _streamCartProduct =
      StreamController.broadcast();

  //get product
  Future<LocalProduct?> getProduct(int maSanPham) async {
    try {
      final db = await dbProvider.database;
      final product = await db.query(
        tableProduct,
        where: 'maSanPham = ?',
        whereArgs: [maSanPham],
      );
      if (product.first.isNotEmpty) {
        return LocalProduct.fromJson(jsonEncode(product.first));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //get all product
  Future<List<LocalProduct>> getAllProduct() async {
    try {
      final db = await dbProvider.database;
      final product = await db.query(
        tableProduct,
      );
      List<LocalProduct> products = [];
      if (product.isNotEmpty) {
        product.forEach((element) {
          products.add(LocalProduct.fromJson(jsonEncode(element)));
        });
        _stream.add(products);
      }
      return products;
    } catch (e) {
      throw 'Lỗi kết nối';
    }
  }

  //add product to cart
  Future<bool> addProduct(int maSanPham, int soLuong) async {
    try {
      final db = await dbProvider.database;
      LocalProduct? product = await getProduct(maSanPham);
      if (product != null) {
        await updateProduct(product, soLuong);
      } else {
        await db.insert(
          tableProduct,
          {
            'maSanPham': maSanPham,
            'soLuong': soLuong,
            'trangThai': 1,
          },
        );
      }
      await getAllProduct();
      return true;
    } catch (e) {
      throw e;
    }
  }

  //update product to cart
  Future<bool> updateProduct(LocalProduct localProduct, int soLuong) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableProduct,
        {
          'soLuong': soLuong,
        },
        where: 'maSanPham = ?',
        whereArgs: [localProduct.maSanPham],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //update product status to cart
  Future<bool> updateProductStatus(int maSanPham, int trangThai) async {
    try {
      final db = await dbProvider.database;
      await db.update(
        tableProduct,
        {
          'trangThai': trangThai,
        },
        where: 'maSanPham = ?',
        whereArgs: [maSanPham],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  //delete product to cart
  Future<bool> deleteProduct(int maSanPham) async {
    try {
      final db = await dbProvider.database;
      await db.delete(
        tableProduct,
        where: 'maSanPham = ?',
        whereArgs: [maSanPham],
      );
      await getAllProduct();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> addPrice(List<Product> products) async {
    num res = 0;
    List<LocalProduct> locals = await getAllProduct();
    for (int i = 0; i < products.length; i++) {
      res += products[i].price * locals[i].soLuong;
    }
    _streamTotal.add(res);
  }

  void addCartProduct(List<Product> products, List<LocalProduct> locals) {
    final cart = CartProduct(products: products, locals: locals);
    _streamCartProduct.add(null);
    _streamCartProduct.add(cart);
  }

  //stream product
  Stream<List<LocalProduct>> allProduct() => _stream.stream;
  Stream<num> totalPrice() => _streamTotal.stream;
  Stream<CartProduct?> cartProduct() => _streamCartProduct.stream;
}
