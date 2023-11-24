import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class ShippingAddressInput extends StatefulWidget {
  final String title;
  final String detail;
  final double width;
  final bool isAdressPicker;
  late final String selectedValue;
  ShippingAddressInput({
    super.key,
    required this.title,
    required this.detail,
    required this.width,
    required this.isAdressPicker,
    required this.selectedValue,
  });

  @override
  State<ShippingAddressInput> createState() => _ShippingAddressInputState();
}

class _ShippingAddressInputState extends State<ShippingAddressInput> {
  List<String> items = ['1', '2', '3'];
  // final VNDistrict vnDistrict = VNDistrict;
  // final VNWard vnWard = VNWard();
  String? selectedItem = '1';

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: widget.width,
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
            width: widget.width,
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Color(0xffebebeb)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                controller: _textEditingController,
                style: TextStyle(
                  color: grey400,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                cursorColor: grey400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
