import 'package:flutter_ovumb_app_version1/data/repositories/nguoidung/nguoidung_provider.dart';

class NguoiDungRepository {
  final _provider = NguoiDungProvider();

  Future<int?> getTrangThai() => _provider.getTrangThai();

  Future<bool> updateTrangThai({
    required int trangThai,
  }) =>
      _provider.updateTrangThai(trangThai);
}
