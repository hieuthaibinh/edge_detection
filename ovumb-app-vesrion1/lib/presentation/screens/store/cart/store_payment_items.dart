import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StorePaymentItems extends StatelessWidget {
  const StorePaymentItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthContiner = size.width - 120 - 100 - 40;
    final products = [];
    int itemCount = widthContiner ~/ 65 + 1;
    int itemLoaded = itemCount < products.length ? itemCount : products.length;
    return Container(
      height: 155,
      width: size.width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(
                text: 'Giỏ hàng',
                fontWeight: FontWeight.w600,
                size: 14,
                color: grey700,
              ),
              TitleText(
                text: 'Chỉnh sửa',
                fontWeight: FontWeight.w600,
                size: 12,
                color: violet500,
              ),
            ],
          ),
          Container(
            height: 100,
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: List.generate(
                      itemLoaded,
                      (index) => Positioned(
                        left: (itemLoaded - index - 1) * 70,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: rose100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 3,
                              color: whiteColor,
                            ),
                          ),
                          child: Image.asset(
                            products[index].product.image,
                            scale: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: grey500,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: grey500,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: grey500,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
