import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/product_category.dart';
import 'package:flutter_ovumb_app_version1/data/models/store/store_slider.dart';

abstract class StoreState extends Equatable {
  final bool isLoading;
  final String? loadingText;
  const StoreState({
    required this.isLoading,
    this.loadingText,
  });

  @override
  List<Object> get props => [];
}

class HomeStoreInitialState extends StoreState {
  HomeStoreInitialState({
    required super.isLoading,
  });
}

class HomeStoreState extends StoreState {
  final List<ProductCategory> products;
  final List<StoreSlider> sliders;
  HomeStoreState({
    required this.sliders,
    required this.products,
    required super.isLoading,
  });
}

class LoadingState extends StoreState {
  LoadingState({
    required super.isLoading,
    super.loadingText,
  });
}

class LoadingFailureState extends StoreState {
  final String error;
  LoadingFailureState({
    required super.isLoading,
    required this.error,
  });
}
