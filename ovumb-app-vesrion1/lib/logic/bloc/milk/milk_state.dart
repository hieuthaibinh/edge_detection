import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/trieuchung.dart';

abstract class MilkState extends Equatable {
  final bool isLoading;
  final String? loadingText;
  const MilkState({
    required this.isLoading,
    this.loadingText,
  });

  @override
  List<Object> get props => [];
}

class MilkInitialState extends MilkState {
  MilkInitialState({
    required super.isLoading,
  });
}

class InsertBabySuccessState extends MilkState {
  final Con con;
  InsertBabySuccessState({
    required super.isLoading,
    required this.con,
  });
}

class InsertBabyFailureState extends MilkState {
  InsertBabyFailureState({
    required super.isLoading,
  });
}

class UpdateBabySuccessState extends MilkState {
  UpdateBabySuccessState({
    required super.isLoading,
  });
}

class UpdateBabyFailureState extends MilkState {
  UpdateBabyFailureState({
    required super.isLoading,
  });
}

class BabyExistState extends MilkState {
  final Con con;
  final List<PhatTrienCon> phatTrienCon;
  final List<ChoAn> choAn;
  final List<TrieuChung> trieuChung;
  BabyExistState({
    required super.isLoading,
    required this.con,
    required this.phatTrienCon,
    required this.choAn,
    required this.trieuChung,
  });
}

class BabyNotExistState extends MilkState {
  final bool? isAdd;
  BabyNotExistState({
    required super.isLoading,
    this.isAdd,
  });
}

class ChoAnState extends MilkState {
  final List<ChoAn> listChoAn;
  ChoAnState({
    required super.isLoading,
    required this.listChoAn,
  });
}


class LoadingState extends MilkState {
  LoadingState({
    required super.isLoading,
    super.loadingText,
  });
}

class LoadingFailureState extends MilkState {
  final String error;
  LoadingFailureState({
    required super.isLoading,
    required this.error,
  });
}
