
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/handle/number_handle.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreOrderProduct extends StatelessWidget {
  final Product product;
  final int quanyity;
  const StoreOrderProduct({
    Key? key,
    required this.product,
    required this.quanyity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 70,
      width: size.width,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: rose100,
            ),
            child: Image.asset(
              product.image,
              scale: 4,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  text: product.name,
                  fontWeight: FontWeight.w500,
                  size: 16,
                  color: grey700,
                  maxLines: 1,
                ),
                TitleText(
                  text: 'xxx',
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: grey500,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleText(
                      text: NumberHandle().formatPrice(product.price, '.', '₫'),
                      fontWeight: FontWeight.w500,
                      size: 20,
                      color: rose500,
                    ),
                    TitleText(
                      text: 'x$quanyity',
                      fontWeight: FontWeight.w500,
                      size: 14,
                      color: grey500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
