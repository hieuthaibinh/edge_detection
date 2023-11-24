// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/cart/store_location.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/location/location_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/shipping/shipping_add.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ShippingCityPicker extends StatefulWidget {
  final String title;
  final String detail;
  final bool isAdressPicker;
  final List<StoreLocation> cities;
  ShippingCityPicker({
    Key? key,
    required this.title,
    required this.detail,
    required this.isAdressPicker,
    required this.cities,
  }) : super(key: key);

  @override
  State<ShippingCityPicker> createState() => _ShippingCityPickerState();
}

class _ShippingCityPickerState extends State<ShippingCityPicker> {
  LocationRepository _locationRepository = LocationRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: grey700,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: 48,
            width: size.width,
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Color(0xffebebeb)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: DropdownButton<String>(
                underline: SizedBox(),
                iconSize: 0,
                value: citySelect,
                items: widget.cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city.name,
                    child: TitleText(
                        text: city.name,
                        fontWeight: FontWeight.w500,
                        size: 12,
                        color: Colors.black),
                    onTap: () {
                      _locationRepository.getDistricts(code: null);
                      _locationRepository.getDistricts(code: city.code);
                      _locationRepository.getWards(code: null);
                    },
                  );
                }).toList(),
                onChanged: (value) {
                  districtSelect = null;
                  wardSelect = null;
                  citySelect = value!;
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
