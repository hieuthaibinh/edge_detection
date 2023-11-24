import 'package:flutter_ovumb_app_version1/data/models/nguoidung/guide.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/link.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/link/link_provider.dart';

class LinkRepository {
  final _provider = LinkProvider();

  Future<List<Link>> getLink({
    required int type,
  }) =>
      _provider.getLink(type);

  Future<List<Guide>?> getGuideVideos() => _provider.getGuideVideos();
  Future<List<Guide>?> getGuideImages() => _provider.getGuideImages();
  Future<Guide?> getGuideBuMe() => _provider.getGuideBuMe();
}

