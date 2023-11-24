// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/enum/order_status_enum.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_payment_total.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/order/store_order_address.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/order/store_order_product.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/order/store_order_status.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreOrderDetailScreen extends StatefulWidget {
  const StoreOrderDetailScreen({super.key});

  @override
  State<StoreOrderDetailScreen> createState() => _StoreOrderDetailScreenState();
}

class _StoreOrderDetailScreenState extends State<StoreOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          title: TitleText(
            text: 'Thông tin đơn hàng',
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
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              StoreOrderAddress(
                name: 'Minh Chiến',
                phoneNumber: '0912345678',
                address:
                    'LK 13 Romantic Park, Phường Xuân La, Quận Tây Hồ, Hà Nội',
              ),
              const SizedBox(height: 20),
              Container(
                height: 4 * 104,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(12)),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        StoreOrderProduct(
                          product: Product(
                            id: 0,
                            image: 'assets/images/phase5_product1.png',
                            name: 'Glutathione Maxx 500',
                            price: 599000,
                            description: '',
                            content: '',
                            guide: '',
                            productId: 1,
                            sale: 599000,
                          ),
                          quanyity: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Divider(
                            color: grey300,
                            height: 30,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              StoreOrderStatus(
                orderStatus: OrderStatusEnum.processing,
                detail: 'Đơn hàng sẽ được xác nhận trong ?? tiếng',
                image: 'assets/stores/status_processing.png',
              ),
              const SizedBox(height: 20),
              StorePaymentTotal(
                itemTotal: 1000000,
                shipFee: 1000000,
                voucher: 1000000,
                totalBill: 1000000,
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: size.width,
                decoration: BoxDecoration(
                  color: rose400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: TitleText(
                    text: 'Đã nhận hàng',
                    fontWeight: FontWeight.w600,
                    size: 16,
                    color: whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
