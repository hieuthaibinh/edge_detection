class DataQuenMatkhau {
  int id;
  String title;
  String titleButton;

  DataQuenMatkhau( this.id, this.title, this.titleButton);
}

List<DataQuenMatkhau> dataQuenMatKhau = [
  DataQuenMatkhau(0, 'Quên mật khẩu', 'Nhận mã OTP'),
  DataQuenMatkhau(3, 'Xác nhận mã OTP', 'Xác nhận mã OTP'),
  DataQuenMatkhau(1, 'Tạo mật khẩu mới', 'Xác nhận'),
];
