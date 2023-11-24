import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

enum OrderStatusEnum {
  processing,
  confirmed,
  delivering,
  success,
  cancelled,
}

class OrderSatus {
  String buildText(OrderStatusEnum orderStatus) {
    switch (orderStatus) {
      case OrderStatusEnum.processing:
        return 'Đang xử lý';
      case OrderStatusEnum.confirmed:
        return 'Đã xác nhận';
      case OrderStatusEnum.delivering:
        return 'Đang vận chuyển';
      case OrderStatusEnum.success:
        return 'Đã giao hàng';
      case OrderStatusEnum.cancelled:
        return 'Đã hủy';
      default:
        return 'Đang xử lý';
    }
  }

  Color buildTextColor(OrderStatusEnum orderStatus) {
    switch (orderStatus) {
      case OrderStatusEnum.processing:
        return grey400;
      case OrderStatusEnum.confirmed:
        return Color(0xffED9A77);
      case OrderStatusEnum.delivering:
        return Color(0xff6DA2F1);
      case OrderStatusEnum.success:
        return Color(0xff62CF9B);
      case OrderStatusEnum.cancelled:
        return Color(0xffED7793);
      default:
        return grey400;
    }
  }

  Color buildBgColor(OrderStatusEnum orderStatus) {
    switch (orderStatus) {
      case OrderStatusEnum.processing:
        return grey200;
      case OrderStatusEnum.confirmed:
        return Color(0xffFFF1EB);
      case OrderStatusEnum.delivering:
        return Color(0xffEBF8FF);
      case OrderStatusEnum.success:
        return Color(0xffEBFFF3);
      case OrderStatusEnum.cancelled:
        return Color(0xffFFEBF2);
      default:
        return grey25;
    }
  }
}
