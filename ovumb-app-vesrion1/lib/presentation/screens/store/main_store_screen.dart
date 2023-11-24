import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/slider/slider_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/store/store_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/store/store_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/store/store_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_cart_icon.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_cart_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/product/store_product_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_menu_button.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_search_input.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_slider.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/store_home_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class MainStoreScreen extends StatefulWidget {
  static const routeName = 'main-store-screen';
  const MainStoreScreen({super.key});

  @override
  State<MainStoreScreen> createState() => _MainStoreScreenState();
}

class _MainStoreScreenState extends State<MainStoreScreen> {
  late FocusNode _focusNode;

  List<String> images = [
    'assets/stores/menu_icon1.png',
    'assets/stores/menu_icon2.png',
    'assets/stores/menu_icon3.png',
    'assets/stores/menu_icon4.png',
  ];
  List<String> titles = [
    'Trạng thái\nđơn hàng',
    'Lịch sử\nđơn hàng',
    'Địa chỉ\ngiao hàng',
    'Thông tin\nthanh toán',
  ];

  List<Product> searchs = [];

  @override
  void initState() {
    // _focusNode.addListener(() {
    _focusNode = FocusNode();
    context.read<StoreBloc>().add(HomeStoreEvent(phase: 1));
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: TitleText(
            text: 'OvumB Store',
            fontWeight: FontWeight.w600,
            size: 18,
            color: rose500,
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          centerTitle: true,
          leading: IconButton(
            color: Color(0xfffd6f8e),
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            InkWell(
              onTap: () {
                sliderRepository.add(false);
                Navigator.pushNamed(context, StoreCartScreen.routeName);
              },
              child: StoreCartIcon(),
            ),
            IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: Image.asset(
                'assets/icons/right_home_icon.png',
                scale: 3,
              ),
            ),
          ],
        ),
        body: BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) {
            if (state is HomeStoreState) {
              return Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    child: ListView(
                      children: [
                        StoreSliderScreen(
                          timeNextSlide: 5,
                          sliders: state.sliders,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            4,
                            (index) => StoreMenuButton(
                              title: titles[index],
                              image: images[index],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        StoreProductScreen(productCategory: state.products),
                      ],
                    ),
                  ),
                  _focusNode.hasFocus
                      ? Container(
                          height: size.height,
                          width: size.width,
                          color: Colors.black.withOpacity(0.4),
                        )
                      : const SizedBox(),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: StoreSearchInput(
                        name: 'Tìm kiếm sản phẩm',
                        iconUrl: 'assets/stores/search.png',
                        focusNode: _focusNode,
                      ),
                    ),
                  ),
                ],
              );
            }
            return getShimmer(StoreHomeShimmer());
          },
        ),
      ),
    );
  }
}
