// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/cart/store_location.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/location/location_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ShippingAddressPicker extends StatefulWidget {
  final String title;
  final String detail;
  final bool isAdressPicker;
  late final String selectedValue;
  final List<StoreLocation> cities;
  ShippingAddressPicker({
    Key? key,
    required this.title,
    required this.detail,
    required this.isAdressPicker,
    required this.selectedValue,
    required this.cities,
  }) : super(key: key);

  @override
  State<ShippingAddressPicker> createState() => _ShippingAddressPickerState();
}

class _ShippingAddressPickerState extends State<ShippingAddressPicker> {
  String? selectedCity = null;
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
                value: selectedCity,
                items: widget.cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city.name,
                    child: TitleText(
                        text: city.name,
                        fontWeight: FontWeight.w500,
                        size: 12,
                        color: Colors.black),
                    onTap: () {
                      _locationRepository.getDistricts(code: city.code);
                    },
                  );
                }).toList(),
                onChanged: (value) {
                  selectedCity = value!;
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
