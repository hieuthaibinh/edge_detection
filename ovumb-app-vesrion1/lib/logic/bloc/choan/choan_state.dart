import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/suckhoe/choan/choan.dart';


abstract class ChoAnState extends Equatable {
  final bool isLoading;
  final String? loadingText;
  const ChoAnState({
    required this.isLoading,
    this.loadingText,
  });

  @override
  List<Object> get props => [];
}

class ChoAnInitialState extends ChoAnState {
  ChoAnInitialState({
    required super.isLoading,
  });
}

class BuBinhHistoryState extends ChoAnState {
   final List<ChartDataChoAn> chartDataChoAn;
  final List<ChoAn> choAn;
  BuBinhHistoryState({
    required super.isLoading,
    required this.chartDataChoAn,
    required this.choAn,
  });
}

class BuMeHistoryState extends ChoAnState {
  final List<ChartDataChoAn> chartDataChoAn;
  final List<ChoAn> choAn;
  BuMeHistoryState({
    required super.isLoading,
    required this.chartDataChoAn,
    required this.choAn,
  });
}

class AnDamHistoryState extends ChoAnState {
   final List<ChartDataChoAn> chartDataChoAn;
  final List<ChoAn> choAn;
  AnDamHistoryState({
    required super.isLoading,
    required this.chartDataChoAn,
    required this.choAn,
  });
}

class KichSuaState extends ChoAnState {
  final List<ChartDataChoAn> chartDataHistory;
  final List<ChartDataChoAn> chartDataByDay;
  final List<HutSua> hutSua;
  KichSuaState({
    required super.isLoading,
    required this.chartDataHistory,
    required this.chartDataByDay,
    required this.hutSua,
  });
}

class LoadingState extends ChoAnState {
  LoadingState({
    required super.isLoading,
    super.loadingText,
  });
}

class LoadingFailureState extends ChoAnState {
  final String error;
  LoadingFailureState({
    required super.isLoading,
    required this.error,
  });
}
