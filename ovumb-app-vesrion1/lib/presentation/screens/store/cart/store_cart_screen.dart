import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/handle/number_handle.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/product/local_product_repository.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/cart/cart_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/cart/cart_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/cart/cart_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_cart_list_item.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreCartScreen extends StatefulWidget {
  static const routeName = 'store-cart-screen';
  const StoreCartScreen({super.key});

  @override
  State<StoreCartScreen> createState() => _StoreCartScreenState();
}

class _StoreCartScreenState extends State<StoreCartScreen> {
  LocalProductRepository localProductReposity = LocalProductRepository();
  num total = 0;
  bool addEvent = false;

  @override
  void initState() {
    context.read<CartBloc>().add(HomeCartEvent());
    super.initState();
    localProductReposity.totalPrice().listen((event) {
      total = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          title: TitleText(
            text: 'Giỏ hàng',
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              'assets/icons/back_button.png',
              scale: 3.5,
            ),
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 0,
          actions: [],
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is HomeCartState) {
              List<Product> products = state.products;
              List<LocalProduct> locals = state.local;
              return Stack(
                children: [
                  StoreCartListItem(products: products, locals: locals),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: grey300.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(1, 0),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 150,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TitleText(
                                    text: 'Tổng tiền hàng',
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    color: grey500,
                                  ),
                                  const SizedBox(height: 4),
                                  TitleText(
                                    text: NumberHandle()
                                        .formatPrice(total, '.', '₫'),
                                    fontWeight: FontWeight.w700,
                                    size: 16,
                                    color: rose600,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              color: whiteColor,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Color(0xff7F56D9),
                                        Color(0xff7F56D9),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(38),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xff7F56D9).withOpacity(0.1),
                                        spreadRadius: 4,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      )
                                    ]),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            Colors.transparent),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(38),
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all(0),
                                    fixedSize: MaterialStatePropertyAll(
                                        Size(size.width, 50)),
                                    //foregroundColor: MaterialStateProperty.all(roseTitleText),
                                    textStyle: MaterialStatePropertyAll(
                                      TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Thêm vào giỏ hàng',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
