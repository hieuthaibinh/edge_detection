// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class CityDistrictList extends StatefulWidget {
  @override
  _CityDistrictListState createState() => _CityDistrictListState();
}

class _CityDistrictListState extends State<CityDistrictList> {
  List<District> districts = [];
  List<Ward> wards = [];
  List<City> cities = [];

  Dio _dio = Dio();

  int? selectedCity = null; // Change the data type to int
  int? selectedDistrict = null;
  int? selectedWard = null;

  @override
  void initState() {
    super.initState();
  }

  Future<List<City>> fetchData() async {
    final cityResponse = await _dio.get('https://provinces.open-api.vn/api/');
    cities = [];
    if (cityResponse.statusCode == 200) {
      List data = cityResponse.data;
      data.forEach((element) {
        cities.add(City.fromJson(jsonEncode(element)));
      });
      return cities;
    }
    return [];
  }

  Future<List<District>> fetchDistricts(int cityId) async {
    final districtResponse =
        await _dio.get('https://provinces.open-api.vn/api/p/$cityId?depth=2');
    districts = [];
    if (districtResponse.statusCode == 200) {
      List data = districtResponse.data['districts'];
      data.forEach((element) {
        districts.add(District.fromJson(jsonEncode(element)));
      });
      return districts;
    }
    return [];
  }

  Future<List<Ward>> fetchWards(int districtId) async {
    final wardResponse = await _dio
        .get('https://provinces.open-api.vn/api/d/$districtId?depth=2');
    wards = [];
    if (wardResponse.statusCode == 200) {
      List data = wardResponse.data['wards'];
      data.forEach((element) {
        wards.add(Ward.fromJson(jsonEncode(element)));
      });
      return wards;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn tỉnh thành, quận huyện và phường xã'),
      ),
      body: FutureBuilder<List<City>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<City> cities = snapshot.data!;
            return Center(
              child: Column(
                children: <Widget>[
                  DropdownButton<int>(
                    // Change the data type to int
                    hint: Text('Chọn tỉnh thành'),
                    value: selectedCity,
                    items: cities.map((city) {
                      return DropdownMenuItem<int>(
                        // Change the data type to int
                        value: city.code, // Use the city code as the value
                        child: TitleText(
                            text: city.name,
                            fontWeight: FontWeight.w500,
                            size: 12,
                            color: Colors.black),
                        onTap: () {
                          fetchDistricts(city.code);
                          setState(() {
                            selectedCity = city.code;
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                      });
                    },
                  ),
                  DropdownButton<int>(
                    // Change the data type to int
                    hint: Text('Chọn tỉnh thành'),
                    value: selectedDistrict,
                    items: districts.map((district) {
                      return DropdownMenuItem<int>(
                        // Change the data type to int
                        value:
                            district.code, // Use the district code as the value
                        child: TitleText(
                            text: district.name,
                            fontWeight: FontWeight.w500,
                            size: 12,
                            color: Colors.black),
                        onTap: () {
                          fetchWards(district.code);
                          setState(() {
                            selectedDistrict = district.code;
                          });
                          // fetchDistricts(city['code']);
                          // setState(() {
                          //   selectedCity = city['code'];
                          //   selectedDistrict = '';
                          //   selectedWard = '';
                          // });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDistrict = value!;
                      });
                    },
                  ),
                  DropdownButton<int>(
                    // Change the data type to int
                    hint: Text('Chọn tỉnh thành'),
                    value: selectedWard,
                    items: wards.map((ward) {
                      return DropdownMenuItem<int>(
                        // Change the data type to int
                        value: ward.code, // Use the ward code as the value
                        child: TitleText(
                            text: ward.name,
                            fontWeight: FontWeight.w500,
                            size: 12,
                            color: Colors.black),
                        onTap: () {
                          setState(() {
                            selectedWard = ward.code;
                          });
                          // fetchDistricts(city['code']);
                          // setState(() {
                          //   selectedCity = city['code'];
                          //   selectedDistrict = '';
                          //   selectedWard = '';
                          // });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedWard = value!;
                      });
                    },
                  ),
                  Text(
                      'Kết quả: $selectedCity | $selectedDistrict | $selectedWard'),
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// Đối tượng để lưu trữ thông tin thành phố
class City {
  final String name;
  final int code;

  City(this.name, this.code);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      map['name'] as String,
      map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);
}

// Đối tượng để lưu trữ thông tin quận/huyện
class District {
  final String name;
  final int code;

  District(this.name, this.code);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      map['name'] as String,
      map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source) as Map<String, dynamic>);
}

// Đối tượng để lưu trữ thông tin phường/xã
class Ward {
  final String name;
  final int code;

  Ward(this.name, this.code);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
    };
  }

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(
      map['name'] as String,
      map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ward.fromJson(String source) =>
      Ward.fromMap(json.decode(source) as Map<String, dynamic>);
}
