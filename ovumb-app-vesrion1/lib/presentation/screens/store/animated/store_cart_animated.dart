// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/slider/slider_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_store.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

// ignore: must_be_immutable
class StoreCartAnimated extends StatefulWidget {
  StoreCartAnimated({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreCartAnimated> createState() => _StoreCartAnimatedState();
}

class _StoreCartAnimatedState extends State<StoreCartAnimated>
    with TickerProviderStateMixin {
  int count = 0;
  double total = 0;
  double price = 599000;
  bool _addToStore = false;
  bool _showImage = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
    value: 1.2,
  );
  late AnimationController _productController;
  late Animation<Offset> _productAnimation;
  Duration forwardDuration = Duration(seconds: 2);
  Duration reverseDuration = Duration(milliseconds: 100);

  void _tapSubmitButton() {
    _controller.reverse();
    Future.delayed(Duration(milliseconds: 150), () {
      _controller.forward();
    });
  }

  void _tapSubmitImage() {
    _showImage = true;
    setState(() {});
    LoadingStore().show(context: context);
    Future.delayed(Duration(milliseconds: 1000), () {
      _addToStore = true;
      setState(() {});
      _productController.duration = forwardDuration;
      _productController.forward();
      Future.delayed(Duration(milliseconds: 400), () {
        LoadingStore().hide();
        Future.delayed(Duration(milliseconds: 400), () {
          _tapSubmitButton();
          _addToStore = false;
          setState(() {});
          showStoreSuccessToast(context, 'Thêm sản phẩm thành công');
          _productController.duration = reverseDuration;
          _productController.reverse();
          Future.delayed(Duration(milliseconds: 400), () {
            _showImage = false;
            setState(() {});
          });
        });
      });
    });
  }

  @override
  void initState() {
    _productController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _productAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 0),
    ).animate(CurvedAnimation(
      parent: _productController,
      curve: Curves.fastOutSlowIn,
    ));

    sliderRepository.streamCartAnimated().listen((event) {
      print(event);
      _tapSubmitImage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final appBarHeight = appBar.preferredSize.height;
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: appBarHeight,
      right: 0,
      left: 0,
      child: SlideTransition(
        position: _productAnimation,
        child: AnimatedContainer(
          //color: Colors.amber,
          height: _showImage
              ? _addToStore
                  ? 0
                  : size.height * 0.7
              : 0,
          width: _showImage
              ? _addToStore
                  ? 0
                  : size.height * 0.7
              : 0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
          child: StreamBuilder<String>(
            stream: sliderRepository.streamCartAnimated(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(
                  snapshot.data!,
                  scale: 3,
                  opacity: AlwaysStoppedAnimation(_addToStore ? 0.5 : 0),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
