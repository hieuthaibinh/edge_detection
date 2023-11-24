import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/trieuchung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_provider.dart';

class MilkRepository {
  final _provider = MilkProvider();

  Future<bool> insert({required Con con}) => _provider.insert(con);
  Future<Con?> find({required int id}) => _provider.find(id);
  Future<List<Con>> get() => _provider.get();
  Future<bool> update({required Con con}) => _provider.update(con);
  Future<bool> updateTrangThai({required Con con}) =>
      _provider.updateTrangThai(con);
  Future<bool> delete({required int id}) => _provider.detele(id);
  Future<bool> updateTrongLuong({
    required int maChoAn,
    required num trongLuong,
    required num? vuTrai,
    required num? vuPhai,
  }) =>
      _provider.updateTrongLuong(maChoAn, trongLuong, vuTrai, vuPhai);
  Future<bool> deleteChoAn({required int maChoAn}) =>
      _provider.deleteChoAn(maChoAn);
  Future<bool> insertPhatTrien({required PhatTrienCon phatTrienCon}) =>
      _provider.insertPhatTrien(phatTrienCon);
  Future<List<PhatTrienCon>> getPhatTrien({required int maCon}) =>
      _provider.getPhatTrien(maCon);
  Future<bool?> insertChoAn({required ChoAn choAn}) =>
      _provider.insertChoAn(choAn);
  Future<List<ChoAn>?> getChoAnByDay({
    required int maCon,
    required DateTime date,
  }) =>
      _provider.getChoAnByDay(maCon, date);
  Future<List<ChoAn>?> getChoAnHistory({
    required int maCon,
    required List<int> maLoaiChoAn,
  }) =>
      _provider.getChoAnHistory(maCon, maLoaiChoAn);
  Future<List<ChoAn>?> getChoAnNgayTao({
    required int maCon,
    required List<int> maLoaiChoAn,
    required DateTime date,
  }) =>
      _provider.getChoAnNgayTao(maCon, maLoaiChoAn, date);
  Future<bool> insertTrieuChung({
    required TrieuChung trieuChung,
  }) =>
      _provider.insertTrieuChung(trieuChung);

  Future<List<TrieuChung>?> getTrieuChung({
    required int maCon,
  }) =>
      _provider.getTrieuChung(maCon);

  Future<bool?> insertHutSua({required HutSua hutSua}) =>
      _provider.insertHutSua(hutSua);
  Future<List<HutSua>?> getHutSuaHistory() => _provider.getHutSuaHistory();
  Future<List<HutSua>?> getHutSuaNgayTao({
    required DateTime date,
  }) =>
      _provider.getHutSuaNgayTao(date);
  Future<bool> updateHutSua({
    required int id,
    required num? vuTrai,
    required num? vuPhai,
  }) =>
      _provider.updateHutSua(id, vuTrai, vuPhai);
  Future<bool> deleteHutSua({required int id}) => _provider.deleteHutSua(id);

  Stream<List<PhatTrienCon>> allListPhatTrien() => _provider.allListPhatTrien();
  Stream<List<ChoAn>> allListChoAn() => _provider.allListChoAn();
  Stream<List<HutSua>> allListHutSua() => _provider.allListHutSua();
}
