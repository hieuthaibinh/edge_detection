// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/handle/number_handle.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/slider/slider_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/animated/store_cart_animated.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/cart/store_cart_icon.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_minus_button.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_plus_button.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/store/widgets/store_slider.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class StoreProductItemDetail extends StatefulWidget {
  static const routeName = 'store-product-item-detail';
  final Product product;
  final String type;
  const StoreProductItemDetail({
    Key? key,
    required this.product,
    required this.type,
  }) : super(key: key);

  @override
  State<StoreProductItemDetail> createState() => _StoreProductItemDetailState();
}

class _StoreProductItemDetailState extends State<StoreProductItemDetail> {
  bool _checkAdd = true;

  int count = 1;
  late num total = 0;
  int _currentPage = 0;
  bool _dragModalBottm = false;

  int _indexTabbar = 0;
  TextEditingController listener = TextEditingController();

  PageController _pageController = PageController(initialPage: 0);

  Duration forwardDuration = Duration(seconds: 2);
  Duration reverseDuration = Duration(milliseconds: 100);

  List<Tabr> tabbar = [
    Tabr(title: 'Mô tả sản phẩm', width: 100),
    Tabr(title: 'Thành phần', width: 75),
    Tabr(title: 'Hướng dẫn sử dụng', width: 125),
  ];

  List<String> sliders = [
    'assets/images/phase5_product1.png',
    'assets/images/phase5_product2.png',
    'assets/images/phase5_product3.png',
  ];

  List<String> contents = [];

  void _addItem(
    LocalProduct product,
  ) {
    if (_checkAdd) {
      _checkAdd = false;
      setState(() {});
      sliderRepository.addCartAnimted(widget.product.image);
      sliderRepository.addCart(product);
      Future.delayed(const Duration(milliseconds: 1500), () {
        _checkAdd = true;
        setState(() {});
      });
    }
  }

  void _initialContent() {
    contents.add(widget.product.description);
    contents.add(widget.product.content);
    contents.add(widget.product.guide);
  }

  @override
  void initState() {
    total = widget.product.price * count;
    _initialContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;
    final totalAppBarHeight = appBarHeight + statusBarHeight;
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height - totalAppBarHeight;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: rose25,
            appBar: AppBar(
              title: TitleText(
                text: 'Thông tin sản phẩm',
                fontWeight: FontWeight.w600,
                size: 18,
                color: grey700,
              ),
              leading: InkWell(
                onTap: () {
                  sliderRepository.add(true);
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/icons/back_button.png',
                  scale: 3.5,
                ),
              ),
              centerTitle: true,
              backgroundColor: rose25,
              shadowColor: whiteColor,
              bottomOpacity: 0.1,
              elevation: 0,
              actions: [
                StoreCartIcon(),
              ],
            ),
            body: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: _dragModalBottm ? 0.0 : 1.0,
                    child: AnimatedContainer(
                      width: size.width,
                      height: _dragModalBottm
                          ? 0
                          : screenHeight * 0.45, // Đây là chiều cao thay đổi
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.fastOutSlowIn,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 200,
                                width: size.width,
                                child: CachedNetworkImage(
                                  imageUrl: widget.product.image,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              );
                            },
                            onPageChanged: (value) {
                              _currentPage = value;
                              setState(() {});
                            },
                          ),
                          _dragModalBottm
                              ? const SizedBox()
                              : Positioned(
                                  bottom: 10,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 8,
                                    width: 100,
                                    alignment: Alignment.center,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return buildIndicator(
                                            index == _currentPage, size);
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy < 0) {
                        // Khi vuốt lên, thay đổi giá trị _dragModalBottm
                        _dragModalBottm = true;
                      } else if (details.delta.dy > 0) {
                        // Khi vuốt xuống, thay đổi giá trị _dragModalBottm
                        _dragModalBottm = false;
                      }
                      setState(() {});
                    },
                    child: AnimatedContainer(
                      width: size.width,
                      height:
                          _dragModalBottm ? screenHeight : screenHeight * 0.55,
                      alignment: _dragModalBottm
                          ? Alignment.center
                          : AlignmentDirectional.topCenter,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              height: 6,
                              width: 40,
                              decoration: BoxDecoration(
                                color: grey200,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: size.width,
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    TitleText(
                                      text: widget.product.name,
                                      fontWeight: FontWeight.w600,
                                      size: 20,
                                      color: grey700,
                                    ),
                                    TitleText(
                                      text: widget.type,
                                      fontWeight: FontWeight.w500,
                                      size: 16,
                                      color: grey500,
                                    ),
                                    const SizedBox(height: 25),
                                    Container(
                                      height: 40,
                                      width: size.width,
                                      child: ListView.builder(
                                        itemCount: tabbar.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _indexTabbar = index;
                                              setState(() {});
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              height: 40,
                                              width: tabbar[index].width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TitleText(
                                                    text: tabbar[index].title,
                                                    fontWeight: FontWeight.w600,
                                                    size: 13,
                                                    color: _indexTabbar == index
                                                        ? Color(0xff7F56D9)
                                                        : grey600,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    color: _indexTabbar == index
                                                        ? Color(0xff7F56D9)
                                                        : whiteColor,
                                                    width: 120,
                                                    height: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TitleText(
                                      text: contents[_indexTabbar],
                                      fontWeight: FontWeight.w500,
                                      size: 14,
                                      maxLines: _dragModalBottm ? 20 : 3,
                                      color: grey500,
                                    ),
                                    const SizedBox(height: 40),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color(0xffE4E7EC),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (count != 0) {
                                                    count--;
                                                    total = widget.product.price
                                                            .toDouble() *
                                                        count;
                                                    setState(() {});
                                                  }
                                                },
                                                child: StoreMinusButton(
                                                  height: 35,
                                                  width: 30,
                                                  backgroundColor: whiteColor,
                                                  iconColor: grey500,
                                                ),
                                              ),
                                              TitleText(
                                                text: count.toString(),
                                                fontWeight: FontWeight.w500,
                                                size: 14,
                                                color: grey500,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  count++;
                                                  total = widget.product.price
                                                          .toDouble() *
                                                      count;
                                                  setState(() {});
                                                },
                                                child: StorePlusButton(
                                                  height: 35,
                                                  width: 30,
                                                  backgroundColor: whiteColor,
                                                  iconColor: grey500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TitleText(
                                          text: NumberHandle()
                                              .formatPrice(total, '.', '₫'),
                                          fontWeight: FontWeight.w500,
                                          size: 24,
                                          color: Color(0xff7F56D9),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: count == 0
                                                ? [
                                                    grey400,
                                                    grey400,
                                                  ]
                                                : [
                                                    Color(0xff7F56D9),
                                                    Color(0xff7F56D9),
                                                  ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(38),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff7F56D9)
                                                  .withOpacity(0.1),
                                              spreadRadius: 4,
                                              blurRadius: 10,
                                              offset: const Offset(0, 3),
                                            )
                                          ]),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (count != 0) {
                                            _addItem(
                                              LocalProduct(
                                                maSanPham:
                                                    widget.product.productId,
                                                soLuong: count,
                                                trangThai: 1,
                                              ),
                                            );
                                          }
                                        },
                                        style: ButtonStyle(
                                          overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(38),
                                            ),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(0),
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          StoreCartAnimated(),
        ],
      ),
    );
  }
}

class Tabr {
  final String title;
  final double width;
  Tabr({
    required this.title,
    required this.width,
  });
}
