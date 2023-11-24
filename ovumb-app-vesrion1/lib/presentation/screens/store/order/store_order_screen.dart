import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/enum/order_status_enum.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/order/store_order_item.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreOrderScreen extends StatefulWidget {
  const StoreOrderScreen({super.key});

  @override
  State<StoreOrderScreen> createState() => _StoreOrderScreenState();
}

class _StoreOrderScreenState extends State<StoreOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          title: TitleText(
            text: 'Chuyển khoản',
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
              StoreOrderItem(orderStatus: OrderStatusEnum.processing),
              StoreOrderItem(orderStatus: OrderStatusEnum.cancelled),
              StoreOrderItem(orderStatus: OrderStatusEnum.success),
              StoreOrderItem(orderStatus: OrderStatusEnum.confirmed),
              StoreOrderItem(orderStatus: OrderStatusEnum.delivering),
              StoreOrderItem(orderStatus: OrderStatusEnum.success),
            ],
          ),
        ),
      ),
    );
  }
}
