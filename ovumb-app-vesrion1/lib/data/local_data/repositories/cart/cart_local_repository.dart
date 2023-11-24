import 'package:flutter_ovumb_app_version1/data/local_data/repositories/cart/cart_local_provider.dart';
import 'package:flutter_ovumb_app_version1/data/models/cart/cart_local.dart';

class CartLocalRepository {
  final _proivder = CartLocalProvider();
  Future<bool> insertItem({
    required CartModel cartModel,
  }) =>
      _proivder.insertItem(cartModel);
  Future<bool> updateQuantity({
    required int maSanPham,
    required int soLuong,
  }) =>
      _proivder.updateQuantity(maSanPham, soLuong);
  Future<bool> deleteItem({
    required int maSanPham,
  }) =>
      _proivder.deleteItem(maSanPham);
}
