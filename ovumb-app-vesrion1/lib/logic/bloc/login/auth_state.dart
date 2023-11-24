// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/enum/age_enum.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';

abstract class AuthState extends Equatable {
  final bool isLoading;
  final String? loadingText;
  const AuthState({
    required this.isLoading,
    this.loadingText,
  });

  @override
  List<Object> get props => [];
}

class AuthStateInitial extends AuthState {
  AuthStateInitial({
    required super.isLoading,
  });
}

class AuthStateLoading extends AuthState {
  AuthStateLoading({
    required super.isLoading,
    required super.loadingText,
  });
}

class AuthStateLogin extends AuthState {
  String taiKhoan;
  String matKhau;
  AuthStateLogin({
    required this.taiKhoan,
    required this.matKhau,
    required super.isLoading,
  });
}

class AuthStateLogged extends AuthState {
  NguoiDung? nguoiDung;
  int phase;
  AuthStateLogged({
    required this.nguoiDung,
    required this.phase,
    required super.isLoading,
  });
}

class AuthStateDisconnect extends AuthState {
  String error;
  AuthStateDisconnect({
    required this.error,
    required super.isLoading,
  });
}

class AuthStateRegistering extends AuthState {
  AuthStateRegistering({
    required super.isLoading,
  });
}

class AuthStateRegisterSuccess extends AuthState {
  String taiKhoan;
  String matKhau;
  AuthStateRegisterSuccess({
    required this.taiKhoan,
    required this.matKhau,
    required super.isLoading,
  });
}

class AuthStateRegisterFailure extends AuthState {
  String error;
  AuthStateRegisterFailure({
    required this.error,
    required super.isLoading,
  });
}

class AuthStateLoggedNotInfor extends AuthState {
  final AgeEnum ageEnum;
  final int? phase;
  AuthStateLoggedNotInfor({
    required this.ageEnum,
    this.phase,
    required super.isLoading,
  });
}

class AuthStateLoginFailure extends AuthState {
  String? error;
  AuthStateLoginFailure({
    this.error,
    required super.isLoading,
  });
}

class AuthStateUserExist extends AuthState {
  AuthStateUserExist({required super.isLoading});
}

class AuthStateInsertKinhNguyetInitial extends AuthState {
  AuthStateInsertKinhNguyetInitial({
    required super.isLoading,
  });
}

class AuthStateInsertKinhNguyetSuccess extends AuthState {
  String maNguoiDung;
  AuthStateInsertKinhNguyetSuccess({
    required this.maNguoiDung,
    required super.isLoading,
  });
}

class AuthStateInsertKinhNguyetFailure extends AuthState {
  final String error;
  AuthStateInsertKinhNguyetFailure({
    required this.error,
    required super.isLoading,
  });
}

class AuthStateLogout extends AuthState {
  AuthStateLogout({
    required super.isLoading,
  });
}

class AuthStateChoosePhase extends AuthState {
  AuthStateChoosePhase({
    required super.isLoading,
  });
}

class AuthStateResetPaswordSuccess extends AuthState {
  AuthStateResetPaswordSuccess({
    required super.isLoading,
  });
}

class AuthStateResetPaswordFailure extends AuthState {
  final String error;
  AuthStateResetPaswordFailure({
    required this.error,
    required super.isLoading,
  });
}
