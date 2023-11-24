import 'package:flutter_ovumb_app_version1/data/repositories/auth/auth_provider.dart';

class AuthRepository {
  final _provider = AuthProvider();

  Future register({
    required String taiKhoan,
    required String matKhau,
    required String tenNguoiDung,
    required String email,
    required String namSinh,
  }) =>
      _provider.register(taiKhoan, matKhau, tenNguoiDung, email, namSinh);

  Future login({
    required String taiKhoan,
    required String matKhau,
  }) =>
      _provider.login(taiKhoan, matKhau);

  Future logout({required String token}) => _provider.logout(token);

  Future resetPassword({
    required String email,
  }) =>
      _provider.resetPassword(email);

  Future changePassword({
    required String matKhau,
    required String matKhauMoi,
    required String password_confirmation,
  }) =>
      _provider.changePassword(matKhau, matKhauMoi, password_confirmation);
}
