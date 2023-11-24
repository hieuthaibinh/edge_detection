import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class DataModalTuVan {
  final int id;
  final String avatar;
  final String name;
  final String linkZalo;
  final String chatbox;
  final String numberPhone;
  final String nam_kinh_nghiem;
  final String phan_tram;
  final String mo_ta;
  final String hocvan;

  DataModalTuVan(
    this.id,
    this.avatar,
    this.name,
    this.linkZalo,
    this.chatbox,
    this.numberPhone,
    this.nam_kinh_nghiem,
    this.phan_tram,
    this.mo_ta,
    this.hocvan,
  );
}

class DataBottomShet {
  final String name;

  DataBottomShet(this.name);
}

class DataStartTuVan1 {
  final int id;
  final String imageAsset;
  final String title;
  final String descrip;
  final String textButton;
  final Color textColor;
  final LinearGradient backgroundColor;

  DataStartTuVan1(
    this.id,
    this.imageAsset,
    this.title,
    this.descrip,
    this.textButton,
    this.textColor,
    this.backgroundColor,
  );
}

List<List<DataStartTuVan1>> dataTuVan = [
  dataStartTuVanPhase1,
  dataStartTuVanPhase2,
  dataStartTuVanPhase5,
];

List<DataStartTuVan1> dataStartTuVanPhase1 = [
  DataStartTuVan1(
    0,
    'assets/images/image.png',
    'Kiến thức tính ngày an toàn',
    'Kiến thức tính ngày an toàn chuẩn y khoa được chia sẻ trực tiếp từ các chuyên gia',
    'Xem thêm',
    Palette.textColor,
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        rose500,
        rose300,
      ],
    ),
  ),
  DataStartTuVan1(
    1,
    'assets/images/bacsi.png',
    'Đội ngũ chuyên gia',
    'Đội ngũ chuyên gia chuyên nghiệp, tận tâm, đồng hành 24/7',
    'Xem thêm',
    violet600,
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        violet500,
        violet800,
      ],
    ),
  ),
];

List<DataStartTuVan1> dataStartTuVanPhase2 = [
  DataStartTuVan1(
    0,
    'assets/images/image.png',
    'Kiến thức sinh sản',
    'Kiến thức sinh sản chuẩn y khoa được chia sẻ trực tiếp từ các chuyên gia',
    'Xem thêm',
    Palette.textColor,
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        rose500,
        rose300,
      ],
    ),
  ),
  DataStartTuVan1(
    1,
    'assets/images/bacsi.png',
    'Đội ngũ chuyên gia của OvumB',
    'Đội ngũ chuyên gia chuyên nghiệp, tận tâm, đồng hành 24/7',
    'Xem thêm',
    violet600,
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        violet500,
        violet800,
      ],
    ),
  ),
];

List<DataStartTuVan1> dataStartTuVanPhase5 = [
  DataStartTuVan1(
    0,
    'assets/images/phase5_gdgt1.png',
    '5 Hành Vi Báo động',
    'Nhận diện các hành vi báo động để tránh bị xâm hại tình dục.',
    'Xem thêm',
    Palette.textColor,
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        rose500,
        rose300,
      ],
    ),
  ),
  DataStartTuVan1(
    1,
    'assets/images/phase5_gdgt2.png',
    'Quy tắc 5 “Không”',
    'Giúp trẻ tránh xa những đối tượng nguy hiểm, bảo vệ chính bản thân mình',
    'Xem thêm',
    violet600,
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        violet500,
        violet800,
      ],
    ),
  ),
  DataStartTuVan1(
    2,
    'assets/images/phase5_gdgt3.png',
    'Đánh bay mụn dậy thì',
    'Bỏ túi 5 bước trị mụn cực đơn giản. Xem ngay lưu ý trị mụn tại nhà',
    'Xem thêm',
    Color(0xff4D7EFF),
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff7BA0FF),
        Color(0xff4168F2),
      ],
    ),
  ),
  DataStartTuVan1(
    3,
    'assets/images/phase5_gdgt4.png',
    'Loại bỏ mùi cơ thể',
    'Giữ gìn cơ thể của mình thật sạch sẽ để khỏe mạnh phát triển',
    'Xem thêm',
    Color(0xffFE7347),
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
       colors: [
        Color(0xffFFB74A),
        Color(0xffFE7347),
      ],
     
    ),
  ),
];

class DataStartTuVan2 {
  final int id;
  final String imageAsset;
  final String title;
  final String descrip;
  final LinearGradient opacityColor;

  DataStartTuVan2(
      this.id, this.imageAsset, this.title, this.descrip, this.opacityColor);
}

List<DataStartTuVan2> dataStartTuVan2 = [
  DataStartTuVan2(
    0,
    'assets/images/nu.png',
    'Sản phẩm khuyên dùng cho nữ giới',
    'Sản phẩm chất lượng, đã được kiểm định bởi FDA & CE',
    const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff2c0005),
        Color(0xff2c0005),
        Color(0xff8c2f40),
        Colors.white,
        Colors.white,
      ],
    ),
  ),
  DataStartTuVan2(
    1,
    'assets/images/nam.png',
    'Sản phẩm khuyên dùng cho nam giới',
    'Sản phẩm chất lượng, đã được kiểm định bởi FDA & CE',
    const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff00112b),
        Color(0xff00112b),
        Color(0xff223760),
        Colors.white,
        Colors.white,
      ],
    ),
  ),
];