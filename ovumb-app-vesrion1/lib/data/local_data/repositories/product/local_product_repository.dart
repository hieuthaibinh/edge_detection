import 'package:flutter_ovumb_app_version1/data/local_data/repositories/product/local_product_provider.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/cart_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';

class LocalProductRepository {
  final localProvider = LocalProductProvider();
  Future<LocalProduct?> getProduct({
    required int maSanPham,
  }) =>
      localProvider.getProduct(maSanPham);

  Future<List<LocalProduct>> getAllProduct() => localProvider.getAllProduct();
  Future<bool> addProduct({
    required int maSanPham,
    required int soLuong,
  }) =>
      localProvider.addProduct(maSanPham, soLuong);
  Future<bool> updateProduct({
    required LocalProduct localProduct,
    required int soLuong,
  }) =>
      localProvider.updateProduct(localProduct, soLuong);
  Future<bool> updateProductStatus({
    required int maSanPham,
    required int trangThai,
  }) =>
      localProvider.updateProductStatus(maSanPham, trangThai);

  Future<bool> deleteProduct({required int maSanPham}) =>
      localProvider.deleteProduct(maSanPham);
  
  void addPrice({
    required List<Product> products,
  }) => localProvider.addPrice(products);

  void addCartProduct({
    required List<Product> products,
    required List<LocalProduct> locals,
  }) => localProvider.addCartProduct(products, locals);
  
  Stream<List<LocalProduct>> allProduct() => localProvider.allProduct();
  Stream<num> totalPrice() => localProvider.totalPrice();
  Stream<CartProduct?> cartProduct() => localProvider.cartProduct();

}
