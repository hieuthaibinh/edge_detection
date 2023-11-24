// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/handle/number_handle.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StorePaymentTotal extends StatelessWidget {
  final int itemTotal;
  final int shipFee;
  final int voucher;
  final int totalBill;
  const StorePaymentTotal({
    Key? key,
    required this.itemTotal,
    required this.shipFee,
    required this.voucher,
    required this.totalBill,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 225,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: 'Tổng tiền hàng',
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: grey400,
                ),
                TitleText(
                  text:
                      NumberHandle().formatPrice(itemTotal, '.', '₫'),
                  fontWeight: FontWeight.w600,
                  size: 16,
                  color: rose500,
                ),
              ],
            ),
          ),
          Divider(
            color: grey200,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: 'Phí vận chuyển',
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: grey400,
                ),
                TitleText(
                  text:
                      NumberHandle().formatPrice(shipFee, '.', '₫'),
                  fontWeight: FontWeight.w600,
                  size: 16,
                  color: rose500,
                ),
              ],
            ),
          ),
          Divider(
            color: grey200,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: 'Voucher giảm',
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: grey400,
                ),
                TitleText(
                  text:
                      NumberHandle().formatPrice(voucher, '.', '₫'),
                  fontWeight: FontWeight.w600,
                  size: 16,
                  color: violet500,
                ),
              ],
            ),
          ),
          Divider(
            color: grey200,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: 'THÀNH TIỀN',
                  fontWeight: FontWeight.w400,
                  size: 14,
                  color: grey400,
                ),
                TitleText(
                  text:
                      NumberHandle().formatPrice(totalBill, '.', '₫'),
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: rose500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
