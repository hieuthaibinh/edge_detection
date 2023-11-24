import 'dart:async';

import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';

class SliderProvider {
  static final SliderProvider _instance = SliderProvider._internal();
  factory SliderProvider() {
    return _instance;
  }
  SliderProvider._internal();

  final StreamController<bool> _streamSlider = StreamController.broadcast();
  final StreamController<LocalProduct> _streamCart = StreamController.broadcast();
  final StreamController<String> _streamCartAnimated = StreamController.broadcast();

  void add(bool event) {
    _streamSlider.add(event);
  }

  void addCart(LocalProduct event) {
    _streamCart.add(event);
  }

  void addCartAnimted(String event) {
    _streamCartAnimated.sink.add(event);
  }


  Stream<bool> streamSlider() => _streamSlider.stream;
  Stream<LocalProduct> streamCart() => _streamCart.stream;
  Stream<String> streamCartAnimated() => _streamCartAnimated.stream;

}
