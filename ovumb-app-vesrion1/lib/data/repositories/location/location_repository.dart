
import 'package:flutter_ovumb_app_version1/data/models/cart/store_location.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/location/location_provider.dart';

class LocationRepository {
  final localProvider = LocationProvider();

  Future<List<StoreLocation>> getProvinces() => localProvider.getProvinces();
  Future<List<StoreLocation>> getDistricts({
    required String? code,
  }) => localProvider.getDistricts(code);
  Future<List<StoreLocation>> getWards({
    required String? code,
  }) => localProvider.getWards(code);

  Stream<List<StoreLocation>> cityStream() => localProvider.cityStream();
  Stream<List<StoreLocation>> districtStream() => localProvider.districtStream();
  Stream<List<StoreLocation>> wardStream() => localProvider.wardStream();
}
