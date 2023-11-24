class DataMocKham {
  final int lanKham;
  final String chiTiet;
  bool isShowDetail;
  bool isAddImage;

  DataMocKham(this.lanKham, this.chiTiet, this.isShowDetail, this.isAddImage);
}

List<DataMocKham> dataMocKham = [
  DataMocKham(
    1,
    'Xác định tim thai\nXác định tuổi thai\nTính ngày dự sinh\nĐánh giá sức khỏe tổng quát của mẹ',
    false,
    false,
  ),
  DataMocKham(
    2,
    'Khám thai\nSàng lọc dị tật thai nhi\nSàng lọc tiền sản giật quý I',
    false,
    false,
  ),
  DataMocKham(
    3,
    'Khám thai\nSiêu âm thai đường bụng\nSiêu âm tử cung buồng trứng\nXét nghiệm nước tiểu, Triple test\nTiêm ngừa uốn ván(VAT)',
    false,
    false,
  ),
  DataMocKham(
    4,
    'Khám thai\nSiêu âm hình thái học 3D/4D\nSiêu âm tử cung buồng trứng\nXét nghiệm nước tiểu',
    false,
    false,
  ),
  DataMocKham(
    5,
    'Khám thai\nSiêu âm thai (thai, nhau thai, nước ối) đường bụng\nXét nghiệm: dung nạp đường huyết, nước tiểu',
    false,
    false,
  ),
  DataMocKham(
    6,
    'Khám thai: đo chiều cao tử cung, đo vòng bụng, nghe tim thai\nSiêu âm thai: xác định ngôi thai, vị trí nhau bám và độ trưởng thành của bánh nhau, ước lượng cân thai\nXét nghiệm nước tiểu.',
    false,
    false,
  ),
  DataMocKham(
    7,
    'Khám thai: kiểm tra cổ tử cung và các dấu hiệu chuyển dạ sinh non\nSiêu âm thai: xác định ngôi thai, vị trí nhau bám và độ trưởng thành của bánh nhau, ước lượng cân thai\nXét nghiệm nước tiểu',
    false,
    false,
  ),
  DataMocKham(
    8,
    'Khám thai: nghe tim thai, kiểm tra cổ tử cung và các dấu hiệu chuyển dạ\nSiêu âm thai: xác định ngôi thai, vị trí bánh nhau, ước lượng cân thai\nXét nghiệm nước tiểu\nXét nghiệm Non-Stress-Test',
    false,
    false,
  ),
];

class DataNgayDuSinh {
  int ngayconlai;
  int thangconlai;
  DateTime ngaydusinh;

  DataNgayDuSinh(
    this.ngayconlai,
    this.thangconlai,
    this.ngaydusinh,
  );
}

List<DataNgayDuSinh> dataNgayDuSinh = [
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
  DataNgayDuSinh(0, 0, DateTime.parse("2023-08-12 10:57:00")),
];

class DataInforBaby {
  int value;
  int age;
  String height;
  int weight;

  DataInforBaby(this.value, this.age, this.height, this.weight);
}

List<DataInforBaby> dataInforBaby = [
  DataInforBaby(1, 8, '1.6', 1),
  DataInforBaby(2, 12, '5.4', 58),
  DataInforBaby(3, 16, '18.6', 146),
  DataInforBaby(4, 20, '25.7', 330),
  DataInforBaby(5, 24, '32.2', 665),
  DataInforBaby(6, 28, '37.6', 1100),
  DataInforBaby(7, 32, '43', 1755),
  DataInforBaby(8, 36, '47.3', 2600),
  DataInforBaby(9, 40, '51', 3338),
];

class DataCacThangCoBau {
  int ngay;
  int thang;
  DataCacThangCoBau(this.ngay, this.thang);
}

List<DataCacThangCoBau> dataCacThangCoBau = [
  DataCacThangCoBau(0, 1),
  DataCacThangCoBau(0, 2),
  DataCacThangCoBau(0, 3),
  DataCacThangCoBau(0, 4),
  DataCacThangCoBau(0, 5),
  DataCacThangCoBau(0, 6),
  DataCacThangCoBau(0, 7),
  DataCacThangCoBau(0, 8),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
  DataCacThangCoBau(0, 9),
];

class DataThongSo {
  double khoangcach;
  int thang;
  DataThongSo(this.khoangcach, this.thang);
}

List<DataThongSo> dataThongSo = [
  DataThongSo(250, 3),
  DataThongSo(450, 4),
  DataThongSo(670, 5),
  DataThongSo(900, 6),
  DataThongSo(1150, 7),
];

class DataThangCuoiCung {
  DateTime ngaycuoicung;
  DateTime thangcuoicung;

  DataThangCuoiCung(this.ngaycuoicung, this.thangcuoicung);
}

List<DataThangCuoiCung> dataThangCuoiCung = [
  DataThangCuoiCung(
    DateTime.parse("2023-08-12 10:57:00"),
    DateTime.parse("2023-08-12 10:57:00"),
  ),
];
