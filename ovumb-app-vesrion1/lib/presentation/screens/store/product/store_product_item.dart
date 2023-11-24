// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/handle/number_handle.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/slider/slider_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/product/store_product_item_detail.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreProductItem extends StatelessWidget {
  final Product product;
  final String type;
  const StoreProductItem({
    Key? key,
    required this.product,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int discount(Product product) {
      return product.sale! ~/ product.price;
    }

    return InkWell(
      onTap: () async {
        sliderRepository.add(false);
        Navigator.pushNamed(
          context,
          StoreProductItemDetail.routeName,
          arguments: {
            'product': product,
            'type': type,
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 24),
        width: 170,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: 170,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.normal,
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 16,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                      color: rose100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    height: 180,
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  if (discount(product) != 0) ...[
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff734CC9),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: TitleText(
                            text: '${discount(product)}% OFF',
                            fontWeight: FontWeight.w600,
                            size: 11,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 14,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                          text: product.name,
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: grey700,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        TitleText(
                          text: NumberHandle()
                              .formatPrice(product.price, '.', '₫'),
                          fontWeight: FontWeight.w600,
                          size: 12,
                          color: Color(0xff98A2B3),
                          textDecoration: TextDecoration.lineThrough,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        TitleText(
                          text: NumberHandle()
                              .formatPrice(product.price, '.', '₫'),
                          fontWeight: FontWeight.w600,
                          size: 16,
                          color: Color(0xff344054),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      'assets/stores/cart_plus.png',
                      scale: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
