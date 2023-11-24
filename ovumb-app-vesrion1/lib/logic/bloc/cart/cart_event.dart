// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class HomeCartEvent extends CartEvent {
  HomeCartEvent();
}
