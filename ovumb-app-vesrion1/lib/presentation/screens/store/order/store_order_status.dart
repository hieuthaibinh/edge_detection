
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/enum/order_status_enum.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreOrderStatus extends StatelessWidget {
  final OrderStatusEnum orderStatus;
  final String detail;
  final String image;
  const StoreOrderStatus({
    Key? key,
    required this.orderStatus,
    required this.detail,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: violet600,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  text: orderStatus.toString(),
                  fontWeight: FontWeight.w600,
                  size: 14,
                  color: whiteColor,
                  maxLines: 1,
                ),
                const SizedBox(height: 6),
                TitleText(
                  text: detail,
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: whiteColor,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            child: Image.asset(
              image,
              scale: 3,
            ),
          ),
        ],
      ),
    );
  }
}
