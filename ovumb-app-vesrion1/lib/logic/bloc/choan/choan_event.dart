// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class ChoAnEvent extends Equatable {
  const ChoAnEvent();

  @override
  List<Object> get props => [];
}

class ChoanInitialEvent extends ChoAnEvent {
  ChoanInitialEvent();
}

class BuBinhHistoryEvent extends ChoAnEvent {
  final int maCon;
  BuBinhHistoryEvent({
    required this.maCon,
  });
}

class BuMeHistoryEvent extends ChoAnEvent {
  final int maCon;
  BuMeHistoryEvent({
    required this.maCon,
  });
}

class AnDamHistoryEvent extends ChoAnEvent {
  final int maCon;
  AnDamHistoryEvent({
    required this.maCon,
  });
}

class KichSuaEvent extends ChoAnEvent {
  KichSuaEvent();
}