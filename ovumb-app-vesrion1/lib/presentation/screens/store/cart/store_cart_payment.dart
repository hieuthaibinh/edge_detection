import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/handle/number_handle.dart';
import 'package:flutter_ovumb_app_version1/data/models/cart/cart_payment_method.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_pay_method_button.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_pay_method_info.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_payment_items.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_payment_total.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreCartPayment extends StatefulWidget {
  const StoreCartPayment({super.key});

  @override
  State<StoreCartPayment> createState() => _StoreCartPaymentState();
}

class _StoreCartPaymentState extends State<StoreCartPayment> {
  int _currentMethod = 0;
  List<CartPaymentMethod> cartMethods = [
    CartPaymentMethod(
      image: 'assets/stores/pay_cod.png',
      title: 'Thanh toán',
      subTitle: 'Khi nhận hàng (COD)',
      isSelected: true,
    ),
    CartPaymentMethod(
      image: 'assets/stores/pay_qr.png',
      title: 'Chuyển khoản',
      subTitle: '19036851635012 Techcombank',
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          title: TitleText(
            text: 'Thanh Toán',
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          leading: Image.asset(
            'assets/icons/back_button.png',
            scale: 3.5,
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 0,
          actions: [],
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: size.height,
              width: size.width,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 110,
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
                              text: 'Địa chỉ',
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: grey700,
                            ),
                            TitleText(
                              text: 'Thay đổi',
                              fontWeight: FontWeight.w600,
                              size: 12,
                              color: violet500,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: violet200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/stores/location.png',
                                scale: 3,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TitleText(
                                text:
                                    'LK 13 Romantic Park, Phường Xuân La, Quận Tây Hồ, Hà Nội',
                                fontWeight: FontWeight.w500,
                                size: 12,
                                color: grey500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 170,
                    width: size.width,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(
                          text: 'Phương thức thanh toán',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                        Row(
                          children: List.generate(
                            cartMethods.length,
                            (index) => InkWell(
                              onTap: () {
                                cartMethods[_currentMethod].isSelected = false;
                                _currentMethod = index;
                                cartMethods[_currentMethod].isSelected = true;
                                setState(() {});
                              },
                              child: StorePayMethodButton(
                                isSelected: cartMethods[index].isSelected,
                                image: cartMethods[index].image,
                              ),
                            ),
                          ),
                        ),
                        StorePayMethodInfo(
                          title: cartMethods[_currentMethod].title,
                          subTitle: cartMethods[_currentMethod].subTitle,
                          image: cartMethods[_currentMethod].image,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  StorePaymentItems(),
                  const SizedBox(height: 20),
                  Container(
                    height: 70,
                    width: size.width,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: rose100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/stores/voucher.png',
                                scale: 3,
                              ),
                            ),
                            const SizedBox(width: 10),
                            TitleText(
                              text: 'Chọn Voucher',
                              fontWeight: FontWeight.w500,
                              size: 14,
                              color: grey700,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TitleText(
                              text: '1 voucher đã chọn',
                              fontWeight: FontWeight.w500,
                              size: 12,
                              color: grey400,
                            ),
                            const SizedBox(width: 4),
                            Image.asset(
                              'assets/icons/next_button.png',
                              scale: 5,
                              color: grey400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        'assets/stores/note.png',
                        scale: 3,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TitleText(
                            text:
                                'Đơn hàng sẽ được xác nhận từ 1-2 ngày và vận chuyển trong 2-4 ngày sau khi xác nhận',
                            fontWeight: FontWeight.w500,
                            size: 12,
                            color: grey400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  StorePaymentTotal(
                    itemTotal: 1000000,
                    shipFee: 1000000,
                    voucher: 1000000,
                    totalBill: 1000000,
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                width: size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: grey300.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(1, 0),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleText(
                            text: 'Thành tiền',
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey500,
                          ),
                          const SizedBox(height: 4),
                          TitleText(
                            text: NumberHandle()
                                .formatPrice(1000000000, '.', '₫'),
                            fontWeight: FontWeight.w700,
                            size: 16,
                            color: rose600,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        color: whiteColor,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xff7F56D9),
                                  Color(0xff7F56D9),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(38),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff7F56D9).withOpacity(0.1),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(38),
                                ),
                              ),
                              elevation: MaterialStateProperty.all(0),
                              fixedSize: MaterialStatePropertyAll(
                                  Size(size.width, 50)),
                              //foregroundColor: MaterialStateProperty.all(roseTitleText),
                              textStyle: MaterialStatePropertyAll(
                                TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            child: Text(
                              'Thêm vào giỏ hàng',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
