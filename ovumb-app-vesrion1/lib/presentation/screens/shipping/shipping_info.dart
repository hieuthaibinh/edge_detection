import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_shipping.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/shipping/shipping_add.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/shipping/shipping_address.dart';

class ShippingInfo extends StatefulWidget {
  const ShippingInfo({super.key});

  @override
  State<ShippingInfo> createState() => _ShippingInfoState();
}

List<String> _valueOption = ['Uyen Uyen', 'Minh Minh'];

class _ShippingInfoState extends State<ShippingInfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfffafafa),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Địa Chỉ Giao Hàng',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: grey700,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/stores/cart.png',
              scale: 3,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back_icon.png',
            scale: 3,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            ShippingAddress(
              name: _valueOption[0],
              phoneNumber: '09689859',
              adress:
                  'LK 13 Romantic Park, Phường Xuân La, Quận Tây Hồ, Hà Nội',
              distance: 3.2,
              days: 2,
              valueOption: 0,
            ),
            ShippingAddress(
              name: _valueOption[1],
              phoneNumber: '09689859',
              adress:
                  'LK 13 Romantic Park, Phường Xuân La, Quận Tây Hồ, Hà Nội',
              distance: 3.2,
              days: 2,
              valueOption: 1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextButton(
                style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  shadowColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: violet600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Thêm Địa Chỉ Mới',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                onPressed: () {
                  dataShipping[0].isDeleted = false;
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
    );
  }
}
