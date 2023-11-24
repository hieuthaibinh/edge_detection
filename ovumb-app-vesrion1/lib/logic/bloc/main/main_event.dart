// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class HomeEvent extends MainEvent {
  String id;
  HomeEvent({
    required this.id,
  });
}

class ChartEvent extends MainEvent {
  ChartEvent();
}

class CalendarEvent extends MainEvent {
  String id;
  CalendarEvent({
    required this.id,
  });
}

class ProfileEvent extends MainEvent {
  String id;
  ProfileEvent({
    required this.id,
  });
}

class ProfileEditEvent extends MainEvent {
  String id;
  ProfileEditEvent({
    required this.id,
  });
}

class ProfileUpdateEvent extends MainEvent {
  NguoiDung nguoiDung;
  ProfileUpdateEvent({
    required this.nguoiDung,
  });
}

class NgayDuSinhCheckEvent extends MainEvent {
  String id;
  NgayDuSinhCheckEvent({
    required this.id,
  });
}

class NgayDuSinhInsertEvent extends MainEvent {
  ThaiKi thaiKi;
  NgayDuSinhInsertEvent({
    required this.thaiKi,
  });
}

class AllBlogEvent extends MainEvent {
  int phase;
  AllBlogEvent({
    required this.phase,
  });
}

class Phase5BlogEvent extends MainEvent {
  int phase;
  Phase5BlogEvent({
    required this.phase,
  });
}


class AllGroupEvent extends MainEvent {
  int phase;
  AllGroupEvent({
    required this.phase,
  });
}

class TvvEvent extends MainEvent {
  int phase;
  TvvEvent({
    required this.phase,
  });
}

