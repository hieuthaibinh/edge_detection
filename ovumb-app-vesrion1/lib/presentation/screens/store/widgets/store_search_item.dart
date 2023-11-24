// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreSeachItem extends StatefulWidget {
  final Product product;
  final bool isLastItem;
  TextEditingController searchController;
  StoreSeachItem({
    Key? key,
    required this.product,
    required this.isLastItem,
    required this.searchController,
  }) : super(key: key);

  @override
  State<StoreSeachItem> createState() => _StoreSeachItemState();
}

class _StoreSeachItemState extends State<StoreSeachItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 65,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/x_icon.png',
                    scale: 3.5,
                    color: grey400,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.searchController.text = widget.product.name;
                      //setState(() {});
                    },
                    child: Container(
                      height: 55,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: widget.product.name,
                            fontWeight: FontWeight.w500,
                            size: 18,
                            color: grey500,
                          ),
                          Image.asset(
                            'assets/stores/arrow_up.png',
                            scale: 2.2,
                            color: grey400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          !widget.isLastItem
              ? Divider(
                  color: grey300,
                  height: 0,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
