// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/product/widgets/product_item_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ProductCategoryWidget extends StatelessWidget {
  final String? type;
  final List<Product> products;
  const ProductCategoryWidget({
    Key? key,
    this.type,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: type != null ? 290 : 250,
      child: Column(
        children: [
          if (type != null) ...[
            Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.only(left: 20),
              height: 30,
              width: size.width,
              //color: Colors.green,
              child: TitleText(
                text: type!,
                fontWeight: FontWeight.w600,
                size: 18,
                color: grey700,
              ),
            ),
          ],
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItemWidget(
                  product: products[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
