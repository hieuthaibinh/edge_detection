class DataHanhTrangDonBe {
  int id;
  bool isShow;
  String title;
  List<String> detail;

  DataHanhTrangDonBe(this.id, this.isShow, this.title, this.detail);
}

List<DataHanhTrangDonBe> dataHanhTrangDonBe = [
  DataHanhTrangDonBe(
    0,
    false,
    'Bé yêu cần gì',
    [
      'Quần áo sơ sinh cho bé',
      'Quần áo ngủ và túi ngủ',
      'Mũ chụp đầu, bao tay, tất chân',
      'Tã lót và bỉm',
      'Chậu tắm cho bé',
      'Khăn giấy và giấy ướt',
      'Sữa và bình sữa',
      'Dụng cụ y tế: nhiệt kế, thuốc bôi da,...',
      'Khăn và chăn',
      'Giường, đệm cho bé',
      'Ghế ngồi, xe đẩy',
      'Túi đựng tư trang cho bé',
    ],
  ),
  DataHanhTrangDonBe(
    1,
    false,
    'Mẹ cần gì',
    [
      'Quần áo, đồ lót',
      'Cao trà gọi sữa ima, sữa ông thọ',
      'Tiền',
      'Điện thoại, ổ xạc',
      'Bỉm',
      'Khăn, bông ý tế',
      'Cốc, chậu nhỏ, bát đũa',
      'Đồ vệ sinh cá nhân',
      'Túi đựng đồ tư trang cá nhân',
      'Thẻ bảo hiểm y tế',
      'Khẩu trang',
      'Máy hút sữa',
    ],
  ),
];
