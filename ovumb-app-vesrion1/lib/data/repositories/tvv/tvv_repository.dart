import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/tvv/tvv_provider.dart';

class TvvRepository {
  final _provider = TvvProvider();

  Future<List<TVV>> getListTvvByUser({
    required int type,
  }) =>
      _provider.getListTvvByUser(type);
}
