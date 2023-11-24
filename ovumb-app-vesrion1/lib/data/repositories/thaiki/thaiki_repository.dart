import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/thaiki/thaiki_provider.dart';

class ThaiKiRepository {
  final _provider = ThaiKiProvider();

  Future<bool> deleteNgayDuSinh() => _provider.deleteNgayDuSinh();

  Future<bool> insertNgayDuSinh() => _provider.insertNgayDuSinh();

  Future<bool> insertThaiKi({required ThaiKi thaiKi}) =>
      _provider.insertThaiKi(thaiKi);
}
