import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product_category.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/store_slider.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/store/store_provider.dart';

class StoreRepository {
  final _provider = StoreProvider();

  Future<List<ProductCategory>?> getLimitProduct({
    required int phase,
  }) =>
      _provider.getLimitProduct(phase);

  Future<List<Product>?> getAllProduct({
    required int category,
  }) =>
      _provider.getAllProduct(category);

  Future<List<Product>> getProductByListId({
    required List<LocalProduct> products,
  }) =>
      _provider.getProductByListId(products);

  Future<List<StoreSlider>?> getSliders() => _provider.getSliders();
}
