// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';

class CartProduct {
  List<Product> products;
  List<LocalProduct> locals;
  CartProduct({
    required this.products,
    required this.locals,
  });
}
