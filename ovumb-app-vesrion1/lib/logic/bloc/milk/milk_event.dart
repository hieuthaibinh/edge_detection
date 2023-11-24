// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';

abstract class MilkEvent extends Equatable {
  const MilkEvent();

  @override
  List<Object> get props => [];
}

class CheckBabyExistEvent extends MilkEvent {
  CheckBabyExistEvent();
}

class InsertBabyEvent extends MilkEvent {
  Con con;
  InsertBabyEvent({
    required this.con,
  });
}

class UpdateBabyEvent extends MilkEvent {
  Con con;
  UpdateBabyEvent({
    required this.con,
  });
}

class AddBabyEvent extends MilkEvent {
  AddBabyEvent();
}


class CheckChoAnEvent extends MilkEvent {
  int maCon;
  DateTime date;
  CheckChoAnEvent({
    required this.maCon,
    required this.date,
  });
}