import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreCartEmpty extends StatefulWidget {
  const StoreCartEmpty({super.key});

  @override
  State<StoreCartEmpty> createState() => _StoreCartEmptyState();
}

class _StoreCartEmptyState extends State<StoreCartEmpty> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          title: TitleText(
            text: 'Giỏ hàng',
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          leading: Image.asset(
            'assets/icons/back_button.png',
            scale: 3.5, 
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFAFAFA),
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 0,
          actions: [],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/stores/cart_empty.png',
                  scale: 3,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          TitleText(
                            text: 'Giỏ Hàng Trống',
                            fontWeight: FontWeight.w700,
                            size: 24,
                            color: grey700,
                          ),
                          const SizedBox(height: 10),
                          TitleText(
                            text:
                                'Có vẻ như bạn vẫn chưa thêm gì vào giỏ hàng. Hãy lựa chọn thêm sản phẩm nhé!',
                            fontWeight: FontWeight.w500,
                            size: 16,
                            color: grey500,
                            textAlign: TextAlign.center,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/back_icon.png',
                                  scale: 3),
                              const SizedBox(width: 10),
                              TitleText(
                                text: 'Quay lại trang sản phẩm',
                                fontWeight: FontWeight.w500,
                                size: 16,
                                color: rose400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
