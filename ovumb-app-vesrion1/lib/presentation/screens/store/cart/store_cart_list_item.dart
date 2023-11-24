// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/product/local_product_repository.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_cart_item.dart';

// ignore: must_be_immutable
class StoreCartListItem extends StatefulWidget {
  final List<Product> products;
  List<LocalProduct> locals;
  StoreCartListItem({
    Key? key,
    required this.products,
    required this.locals,
  }) : super(key: key);

  @override
  State<StoreCartListItem> createState() => _StoreCartListItemState();
}

class _StoreCartListItemState extends State<StoreCartListItem> {
  LocalProductRepository localProductRepository = LocalProductRepository();

  @override
  void initState() {
    localProductRepository.addCartProduct(
      products: widget.products,
      locals: widget.locals,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: size.height,
      width: size.width,
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: StoreCartItem(
              product: widget.products[index],
              products: widget.products,
              localProduct: widget.locals[index],
            ),
          );
        },
      ),
    );
  }
}
