import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class StoreOrderItemStack extends StatelessWidget {
  const StoreOrderItemStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products = [];
    return Container(
      height: 70,
      width: 120,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: List.generate(
                products.length,
                (index) => Positioned(
                  left: (30 * index).toDouble(),
                  top: 0,
                  bottom: 0,
                  child: Container(
                    height: 70,
                    width: 60,
                    decoration: BoxDecoration(
                      color: rose100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
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
        ],
      ),
    );
  }
}
