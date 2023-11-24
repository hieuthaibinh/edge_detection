// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/handle/number_handle.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/product/local_product_repository.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_minus_button.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_plus_button.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/delete_item.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreCartItem extends StatefulWidget {
  final Product product;
  final List<Product> products;
  LocalProduct localProduct;
  StoreCartItem({
    Key? key,
    required this.product,
    required this.products,
    required this.localProduct,
  }) : super(key: key);

  @override
  State<StoreCartItem> createState() => _StoreCartItemState();
}

class _StoreCartItemState extends State<StoreCartItem> {
  bool accepted = false;
  LocalProductRepository localProductRepository = LocalProductRepository();

  // Hàm tạo sự kiện và thêm vào Stream
  void _sendEvent(int count) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      dismissThresholds: {DismissDirection.endToStart: 0.2},
      confirmDismiss: (direction) {
        return deleteItemDialog(context);
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          // Thực hiện xóa mục tại đây
        }
      },
      background: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 120,
            width: size.width,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: rose100,
            ),
            child: Image.asset(
              'assets/images/trash.png',
              scale: 2,
              color: rose500,
            ),
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (widget.localProduct.trangThai == 0) {
                widget.localProduct.trangThai = 1;
              } else {
                widget.localProduct.trangThai = 0;
              }
              setState(() {});
            },
            child: Container(
              width: 50,
              height: 120,
              child: Image.asset(
                widget.localProduct.trangThai == 1
                    ? 'assets/icons/radio_check.png'
                    : 'assets/icons/radio_uncheck.png',
                scale: 3,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 120,
              width: size.width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Container(
                      color: whiteColor,
                      child: Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 90,
                              decoration: BoxDecoration(
                                color: rose100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget.product.image,
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleText(
                                    text: widget.product.name,
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    color: grey700,
                                    maxLines: 1,
                                  ),
                                  TitleText(
                                    text: 'loaisap',
                                    fontWeight: FontWeight.w500,
                                    size: 12,
                                    color: grey500,
                                    maxLines: 1,
                                  ),
                                  TitleText(
                                    text: NumberHandle().formatPrice(
                                        widget.product.price, '.', '₫'),
                                    fontWeight: FontWeight.w500,
                                    size: 18,
                                    color: Color(0xffF63D68),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              height: 120,
                              width: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: whiteColor,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      widget.localProduct.soLuong++;
                                      localProductRepository.updateProduct(
                                        localProduct: widget.localProduct,
                                        soLuong: widget.localProduct.soLuong,
                                      );
                                      _sendEvent(widget.localProduct.soLuong);
                                      localProductRepository.addPrice(
                                          products: widget.products);
                                    },
                                    child: StorePlusButton(
                                      width: 28,
                                      height: 25,
                                      backgroundColor: grey200,
                                      iconColor: grey500,
                                    ),
                                  ),
                                  TitleText(
                                    text: widget.localProduct.soLuong.toString(),
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    color: grey500,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (widget.localProduct.soLuong == 1) {
                                        bool? check =
                                            await deleteItemDialog(context);
                                        if (check == true) {
                                          await localProductRepository
                                              .deleteProduct(
                                                  maSanPham:
                                                      widget.product.productId);
                                        }
                                      } else {
                                        widget.localProduct.soLuong--;
                                        localProductRepository.updateProduct(
                                          localProduct: widget.localProduct,
                                          soLuong: widget.localProduct.soLuong,
                                        );
                                        _sendEvent(widget.localProduct.soLuong);
                                        localProductRepository.addPrice(
                                            products: widget.products);
                                      }
                                    },
                                    child: StoreMinusButton(
                                      width: 28,
                                      height: 25,
                                      backgroundColor: grey200,
                                      iconColor: grey500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.localProduct.trangThai == 0) ...[
                      Container(
                        height: 120,
                        width: size.width,
                        color: whiteColor.withOpacity(0.4),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
