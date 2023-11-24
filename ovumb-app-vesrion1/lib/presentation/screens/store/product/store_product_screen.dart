// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/store/product_category.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/product/store_product_category.dart';

class StoreProductScreen extends StatelessWidget {
  final List<ProductCategory> productCategory;
  const StoreProductScreen({
    Key? key,
    required this.productCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        productCategory.length,
        (index) => StoreProductCategory(
          products: productCategory[index].products,
          type: productCategory[index].name,
        ),
      ),
    );
  }
}
