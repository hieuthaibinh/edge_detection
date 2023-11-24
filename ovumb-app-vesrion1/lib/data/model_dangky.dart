class DataDangky {
  int id;
  String imageAsset;
  String title;
  String titleButton;
  String betaText;

  DataDangky(
    this.id,
    this.imageAsset,
    this.title,
    this.titleButton,
    this.betaText,
  );
}

List<DataDangky> dataDangky = [
  DataDangky(0, 'assets/images/khoa3.png', 'Đăng ký với số điện thoại',
      'Nhận mã OTP', 'Phiên bản Beta'),
  DataDangky(1, 'assets/images/khoa2.png', 'Xác nhận mã OTP', 'Xác nhận mã OTP',
      'Phiên bản Beta'),
  DataDangky(2, 'assets/images/logo_main.png', 'Tạo mật khẩu', 'Hoàn thành', ' '),
];

// [];  {}
class InforDangky {
  String phoneNumberInfor;
  String passwordInfor;
  String confirmPasswordInfor;

  InforDangky(
    this.confirmPasswordInfor,
    this.passwordInfor,
    this.phoneNumberInfor,
  );
}
