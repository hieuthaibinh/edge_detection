// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';

import 'package:flutter_ovumb_app_version1/presentation/screens/store/product/store_product_item.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreProductCategory extends StatelessWidget {
  final List<Product> products;
  final String type;
  const StoreProductCategory({
    Key? key,
    required this.products,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 335,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 30,
            width: size.width,
            //color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: type,
                  fontWeight: FontWeight.w600,
                  size: 18,
                  color: grey700,
                ),
                TitleText(
                  text: 'Xem thêm',
                  fontWeight: FontWeight.w600,
                  size: 14,
                  color: Color.fromARGB(255, 158, 119, 237),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return StoreProductItem(
                  product: products[index],
                  type: type,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
