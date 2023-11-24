// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:image/image.dart' as img;

abstract class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class TestSubmitLHEvent extends TestEvent {
  final int maQuanLyQueTest;
  final int maLoaiQue;

  final img.Image image;
  TestSubmitLHEvent({
    required this.maQuanLyQueTest,
    required this.maLoaiQue,
    required this.image,
  });
}

class TestCheckEvent extends TestEvent {
  TestCheckEvent();
}

class TestOpenQREvent extends TestEvent {
  TestOpenQREvent();
}

class TestQRSubmitEvent extends TestEvent {
  final String? qrcode;
  TestQRSubmitEvent({
    required this.qrcode,
  });
}

class TestGuideEvent extends TestEvent {
  TestGuideEvent();
}
