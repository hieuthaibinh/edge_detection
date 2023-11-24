// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/enum/order_status_enum.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/order/store_order_item_stack.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreOrderItem extends StatefulWidget {
  final OrderStatusEnum orderStatus;
  const StoreOrderItem({
    Key? key,
    required this.orderStatus,
  }) : super(key: key);

  @override
  State<StoreOrderItem> createState() => _StoreOrderItemState();
}

class _StoreOrderItemState extends State<StoreOrderItem> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      margin: const EdgeInsets.only(top: 20),
      padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    TitleText(
                      text: 'Đơn hàng số: 01293',
                      fontWeight: FontWeight.w500,
                      size: 14,
                      color: grey600,
                    ),
                    const SizedBox(height: 4),
                    TitleText(
                      text: '23-09-2023 3:00',
                      fontWeight: FontWeight.w500,
                      size: 14,
                      color: grey400,
                    ),
                  ],
                ),
              ),
              StoreOrderItemStack(),
            ],
          ),
          Divider(
            color: grey300,
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: OrderSatus().buildBgColor(widget.orderStatus),
                ),
                child: Center(
                  child: TitleText(
                    text: OrderSatus().buildText(widget.orderStatus),
                    fontWeight: FontWeight.w500,
                    size: 12,
                    color: OrderSatus().buildTextColor(widget.orderStatus),
                  ),
                ),
              ),
              Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: grey400,
                ),
                child: Center(
                  child: TitleText(
                    text: 'Đã nhận hàng',
                    fontWeight: FontWeight.w500,
                    size: 12,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
