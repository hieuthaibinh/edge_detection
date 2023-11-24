import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/ketquatest/ketquatest_provider.dart';

class KetQuaTestRepository {
  final _provider = KetQuaTestProvider();

  Future<bool> insertKetQuaTest({
    required KetQuaTest ketQuaTest,
  }) =>
      _provider.insertKetQuaTest(ketQuaTest);

  Future<bool> insertListKetQuaTest({
    required List<KetQuaTest> listKetQuaTest,
  }) =>
      _provider.insertListKetQuaTest(listKetQuaTest);

  Future<List<KetQuaTest>> getListKetQuaTest() => _provider.getListKetQuaTest();
}
