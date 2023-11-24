// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object> get props => [];
}

class HomeStoreEvent extends StoreEvent {
  final int phase;
  HomeStoreEvent({
    required this.phase,
  });
}
