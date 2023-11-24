import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_shipping.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/shipping/shipping_add.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/shipping/shipping_status.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/shipping/shipping_textImage.dart';

class ShippingAddress extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String adress;
  final double distance;
  final int days;
  final int valueOption;
  ShippingAddress({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.adress,
    required this.distance,
    required this.days,
    required this.valueOption,
  });

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  String currentOption = dataShipping[0].option;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(   
      margin: EdgeInsets.only(top: 30),
      height: 150,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 6,
            blurRadius: 9,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Radio(
                  activeColor: violet600,
                  value: dataShipping[widget.valueOption]
                      .option, // Giá trị khi radio button được chọn
                  groupValue:
                      currentOption, // Giá trị của radio button hiện tại
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              color: grey700,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            width: 2.0,
                            height: 20.0,
                            color: grey200,
                          ),
                          SizedBox(width: 15),
                          Text(
                            widget.phoneNumber,
                            style: TextStyle(
                              color: grey700,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.adress,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: grey400,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.06,
                  height: 60,
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    child: Image.asset(
                      'assets/stores/location_penedit.png',
                      scale: 3,
                    ),
                    onTap: () {
                      dataShipping[0].isDeleted = true;
                      setState(() {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          barrierColor: Colors.white.withOpacity(0.001),
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 680,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: ShippingAdd(),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(color: grey200),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShippingTextImage(
                  image: 'assets/stores/location_km.png',
                  number: widget.distance.toString(),
                  text: 'km',
                  color: rose400,
                ),
                SizedBox(width: 5),
                Container(
                  width: 2.0,
                  height: 20.0,
                  color: grey200,
                ),
                SizedBox(width: 5),
                ShippingTextImage(
                  image: 'assets/stores/location_alarm.png',
                  number: widget.days.toString(),
                  text: 'ngày',
                  color: grey400,
                ),
                SizedBox(width: size.width * 0.1),
                ShippingStatus(
                  text: dataShipping[0].isSelectedAdress
                      ? 'Mặc định'
                      : 'Địa chỉ phụ',
                  colorText: dataShipping[0].isSelectedAdress
                      ? violet500
                      : Color(0xffEDA177),
                  colorBackground: dataShipping[0].isSelectedAdress
                      ? violet100
                      : Color(0xffFFF5EB),
                  width: 75,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
