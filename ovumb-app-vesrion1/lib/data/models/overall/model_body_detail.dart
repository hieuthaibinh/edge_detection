import 'package:flutter/material.dart';

import '../../../presentation/screens/phase2/mockham_screen.dart';
import '../../../presentation/screens/phase2/sp_ho_tro.dart';

class DataBodyDetail {
  String image;
  String title;
  Widget widget;

  DataBodyDetail(this.image, this.title, this.widget);
}

List<DataBodyDetail> dataBodyDetail = [
  DataBodyDetail(
    'assets/images/icon1.png',
    'Sản phẩm hỗ trợ',
    SanPhamHoTro(),
  ),
  DataBodyDetail(
    'assets/images/icon2.png',
    'Mốc khám, siêu âm',
    MocKhamScreen(widgetId: 0),
  ),
];
