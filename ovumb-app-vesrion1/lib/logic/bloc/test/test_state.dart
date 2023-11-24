import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/guide.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/quan_ly_que_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/test_resutl.dart';

abstract class TestState extends Equatable {
  final bool isLoading;
  final String? loadingText;
  const TestState({
    required this.isLoading,
    this.loadingText,
  });

  @override
  List<Object> get props => [];
}

class TestStateLoading extends TestState {
  TestStateLoading({
    required super.isLoading,
  });
}

class TestStateInitial extends TestState {
  TestStateInitial({
    required super.isLoading,
  });
}

class TestStateResultSuccess extends TestState {
  final TestResult result;
  final int maKetQuaTest;
  final int lh;
  final int tbnknNew;
  final int position;
  TestStateResultSuccess({
    required this.result,
    required this.maKetQuaTest,
    required this.lh,
    required this.tbnknNew,
    required this.position,
    required super.isLoading,
  });
}

class TestStateResultThaiSuccess extends TestState {
  final TestResult result;
  final int position = 0;
  TestStateResultThaiSuccess({
    required this.result,
    required super.isLoading,
  });
}

class TestStateFailure extends TestState {
  final String error;
  TestStateFailure({
    required this.error,
    required super.isLoading,
  });
}

class TestResultStateFailure extends TestState {
  final TestResult result;
  final int position = 0;
  TestResultStateFailure({
    required this.result,
    required super.isLoading,
  });
}

class TestStateHasQueTest extends TestState {
  final QuanLyQueTest quanLyQueTest;
  final List<Guide> videos;
  final List<Guide> images;
  TestStateHasQueTest({
    required this.quanLyQueTest,
    required this.videos,
    required this.images,
    required super.isLoading,
  });
}

class TestStateHasNoQueTest extends TestState {
  final QuanLyQueTest quanLyQueTest;
  TestStateHasNoQueTest({
    required this.quanLyQueTest,
    required super.isLoading,
  });
}

class TestStateOpenQRTest extends TestState {
  TestStateOpenQRTest({
    required super.isLoading,
  });
}

class TestStateQRSubmitSuccess extends TestState {
  TestStateQRSubmitSuccess({
    required super.isLoading,
  });
}

class TestStateQRSubmitFailure extends TestState {
  final String error;
  TestStateQRSubmitFailure({
    required this.error,
    required super.isLoading,
  });
}

class TestStateGuide extends TestState {
  final List<Guide> videos;
  final List<Guide> images;
  TestStateGuide({
    required this.videos,
    required this.images,
    required super.isLoading,
  });
}