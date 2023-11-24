// {} []
import 'package:flutter_ovumb_app_version1/data/repositories/benh/benh_provider.dart';

class BenhRepository {
  final _provider = BenhProvider();

  Future insertBenh({
    required String tenBenh,
  }) =>
      _provider.insertBenh(
        tenBenh,
      );

  Future updateBenh({
    required String tenBenh,
    required String id,
  }) =>
      _provider.updateBenh(
        tenBenh,
        id,
      );

  Future deleteBenh({
    required String tenBenh,
    required String id,
  }) =>
      _provider.updateBenh(
        tenBenh,
        id,
      );
  Future getBenh({
    required String tenBenh,
    required String id,
  }) =>
      _provider.updateBenh(
        tenBenh,
        id,
      );
}
