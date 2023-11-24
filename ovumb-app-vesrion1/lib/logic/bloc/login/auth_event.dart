// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthEventCheckLogin extends AuthEvent {
  AuthEventCheckLogin();
}

class AuthEventResetPassword extends AuthEvent {
  final String email;
  AuthEventResetPassword({
    required this.email,
  });
}

class AuthEventLogin extends AuthEvent {
  String taiKhoan;
  String matKhau;
  AuthEventLogin(
    this.taiKhoan,
    this.matKhau,
  );
}

class AuthEventRegister extends AuthEvent {
  String taiKhoan;
  String matKhau;
  String tenNguoiDung;
  String email;
  String namSinh;
  AuthEventRegister({
    required this.taiKhoan,
    required this.matKhau,
    required this.tenNguoiDung,
    required this.email,
    required this.namSinh,
  });
}

class AuthEventInsertKinhNguyet extends AuthEvent {
  KinhNguyet kinhNguyet;
  int phase;
  AuthEventInsertKinhNguyet({
    required this.kinhNguyet,
    required this.phase,
  });
}

class AuthEventChoosePhase extends AuthEvent {
  AuthEventChoosePhase();
}

class AuthEventLogout extends AuthEvent {
  AuthEventLogout();
}


