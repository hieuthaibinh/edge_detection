// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/product/local_product_repository.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/slider/slider_repository.dart';

import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

// ignore: must_be_immutable
class StoreCartIcon extends StatefulWidget {
  StoreCartIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreCartIcon> createState() => _StoreCartIconState();
}

class _StoreCartIconState extends State<StoreCartIcon>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
    value: 1.2,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  LocalProductRepository _productRepository = LocalProductRepository();

  void _tapSubmitButton() {
    _controller.reverse();
    Future.delayed(Duration(milliseconds: 150), () {
      _controller.forward();
    });
  }

  @override
  void initState() {
    _productRepository.getAllProduct();
    sliderRepository.streamCart().listen((event) {
      Future.delayed(const Duration(milliseconds: 1800), () {
        _tapSubmitButton();
        _productRepository.addProduct(
            maSanPham: event.maSanPham, soLuong: event.soLuong);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/stores/cart.png',
              scale: 3,
            ),
            StreamBuilder<List<LocalProduct>>(
              stream: _productRepository.allProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        color: rose400,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: whiteColor,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: Center(
                        child: TitleText(
                          text: snapshot.data!.length.toString(),
                          fontWeight: FontWeight.w500,
                          size: 8,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
