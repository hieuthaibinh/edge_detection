// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/type_blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/link.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';

abstract class MainState extends Equatable {
  final bool isLoading;
  final String? loadingText;
  const MainState({
    required this.isLoading,
    this.loadingText,
  });

  @override
  List<Object> get props => [];
}

class MainStateInitial extends MainState {
  MainStateInitial({required super.isLoading});
}

class HomeState extends MainState {
  NguoiDung nguoiDung;
  List<CauHoi> listCauHoi;
  int phase;
  HomeState({
    required this.nguoiDung,
    required this.listCauHoi,
    required this.phase,
    required super.isLoading,
  });
}

class ChartState extends MainState {
  List<KetQuaTest> ketQuaTest;
  ChartState({
    required this.ketQuaTest,
    required super.isLoading,
  });
}

class CalendarState extends MainState {
  NguoiDung nguoiDung;
  List<CauHoi> listCauHoi;
  CalendarState({
    required this.nguoiDung,
    required this.listCauHoi,
    required super.isLoading,
  });
}

class ProfileState extends MainState {
  NguoiDung nguoiDung;
  KinhNguyet kinhNguyetCurrent;

  ProfileState({
    required this.nguoiDung,
    required this.kinhNguyetCurrent,
    required super.isLoading,
  });
}

class ProfileEditState extends MainState {
  NguoiDung nguoiDung;
  ProfileEditState({
    required this.nguoiDung,
    required super.isLoading,
  });
}

class ProfileUpdateSuccessState extends MainState {
  NguoiDung nguoiDung;
  ProfileUpdateSuccessState({
    required this.nguoiDung,
    required super.isLoading,
  });
}

class ProfileUpdateFailureState extends MainState {
  String error;
  ProfileUpdateFailureState({
    required this.error,
    required super.isLoading,
  });
}

class NgayDuSinhHasExistState extends MainState {
  DateTime ngayDuSinh;
  NgayDuSinhHasExistState({
    required this.ngayDuSinh,
    required super.isLoading,
  });
}

class NgayDuSinhHasNotExistState extends MainState {
  NgayDuSinhHasNotExistState({
    required super.isLoading,
  });
}

class LoadingState extends MainState {
  LoadingState({required super.isLoading});
}

class AllBlogState extends MainState {
  List<TypeBlog> listType;
  List<List<Blog>> listBlogs;
  AllBlogState({
    required super.isLoading,
    required this.listType,
    required this.listBlogs,
  });
}

class Phase5BlogState extends MainState {
  List<TypeBlog> listType;
  List<List<Blog>> listBlogs;
  Phase5BlogState({
    required super.isLoading,
    required this.listType,
    required this.listBlogs,
  });
}


class TvvState extends MainState {
  List<TVV> listTvv;
  TvvState({
    required super.isLoading,
    required this.listTvv,
  });
}

class HasNoBlogState extends MainState {
  HasNoBlogState({
    required super.isLoading,
  });
}

class AllGroupState extends MainState {
  List<List<Link>> listLink;
  List<int> listTitle;
  AllGroupState({
    required super.isLoading,
    required this.listTitle,
    required this.listLink,
  });
}

class LoadFailure extends MainState {
  final String error;
  LoadFailure({
    required this.error,
    required super.isLoading,
  });
}


