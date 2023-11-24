// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/product/product_type.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/product/widgets/product_category_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = 'product-screen';
  final String appbarTitle;
  const ProductScreen({
    Key? key,
    required this.appbarTitle,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductType> productType = [
    ProductType(id: 1, name: 'Sản phẩm'),
    ProductType(id: 2, name: null),
    ProductType(id: 3, name: null),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
          ),
          centerTitle: true,
          title: TitleText(
            text: widget.appbarTitle,
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: ListView.builder(
            itemCount: productType.length,
            itemBuilder: (context, index) {
              return ProductCategoryWidget(
                type: productType[index].name,
                products: [],
              );
            },
          ),
        ),
      ),
    );
  }
}
