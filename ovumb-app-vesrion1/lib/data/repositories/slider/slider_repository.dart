import 'package:flutter_ovumb_app_version1/data/models/store/local_product.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/slider/slider_provider.dart';

class SliderRepository {
  final localProvider = SliderProvider();
  Stream<bool> streamSlider() => localProvider.streamSlider();
  Stream<LocalProduct> streamCart() => localProvider.streamCart();
  Stream<String> streamCartAnimated() => localProvider.streamCartAnimated();
  void add(bool event) => localProvider.add(event);
  void addCart(LocalProduct event) => localProvider.addCart(event);
  void addCartAnimted(String event) => localProvider.addCartAnimted(event);
}

SliderRepository sliderRepository = SliderRepository();