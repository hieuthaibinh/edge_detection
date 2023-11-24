import 'package:flutter_ovumb_app_version1/data/repositories/synchronized/synchronized_provider.dart';

class SynchronizedRepository {
  final _provider = SynchronizedProvider();

  Future syncAll({
    required bool connected,
  }) =>
      _provider.syncAll(connected);

  Future syncKinhNguyet() => _provider.syncKinhNguyet();

  Future syncTrangThai() => _provider.syncTrangThai();

  Future syncNhatKyToLocal() => _provider.syncNhatKyToLocal();

  Future syncNhatKyToServer() => _provider.syncNhatKyToServer();

  Future syncNhatKyDeleteToServer() => _provider.syncNhatKyDeleteToServer();

  Future syncLuongKinhToLocal() => _provider.syncLuongKinhToLocal();

  Future syncLuongKinhToServer() => _provider.syncLuongKinhToServer();

  Future syncLuongKinhDeleteToServer() =>
      _provider.syncLuongKinhDeleteToServer();

  Future syncThaiKiToLocal() => _provider.syncThaiKiToLocal();

  Future<bool> syncThaiKiToServer() => _provider.syncThaiKiToServer();

  Future syncKetQuaTestToLocal() => _provider.syncKetQuaTestToLocal();
}
