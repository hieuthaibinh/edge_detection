
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreOrderAddress extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String address;
  const StoreOrderAddress({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 135,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            text: 'Địa chỉ nhận hàng',
            fontWeight: FontWeight.w600,
            size: 16,
            color: grey600,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: violet100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/stores/location.png',
                  scale: 3,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: size.width,
                      child: Row(
                        children: [
                          Flexible(
                            child: TitleText(
                              text: name,
                              fontWeight: FontWeight.w600,
                              size: 16,
                              color: grey600,
                              maxLines: 1,
                            ),
                          ),
                          VerticalDivider(
                            color: grey400,
                            width: 20,
                          ),
                          Flexible(
                            child: TitleText(
                              text: phoneNumber,
                              fontWeight: FontWeight.w600,
                              size: 16,
                              color: grey600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TitleText(
                      text: address,
                      fontWeight: FontWeight.w400,
                      size: 14,
                      color: Color(0xff98A2B3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
