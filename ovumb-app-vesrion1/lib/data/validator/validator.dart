import 'package:flutter/material.dart';

mixin InputValidationMixin {
  bool isNumberValid(String text) {
    String pattern = r'^[0-9]*$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }
}

bool checkEmpty(List<TextEditingController> listController) {
  for (TextEditingController controller in listController) {
    if (controller.text.trim().isEmpty) {
      return false;
    }
  }
  return true;
}

bool checkBirth(String birth) {
  if (int.tryParse(birth) is num && birth.length == 4) {
    return true;
  }
  return false;
}

bool checkCanNang(String canNang) {
  if (double.tryParse(canNang) is num &&
      double.parse(canNang) > 1 &&
      double.parse(canNang) < 120) {
    return true;
  }
  return false;
}

bool checkChieuCao(String chieuCao) {
  if (double.tryParse(chieuCao) is num &&
      double.parse(chieuCao) > 20 &&
      double.parse(chieuCao) < 250) {
    return true;
  }
  return false;
}

bool checkPhoneNumber(String phone) {
  RegExp phoneRegex = RegExp(r'(0[3|5|7|8|9]\d{8}|(?:\+?84|\b84)\d{9})$');
  if (phoneRegex.hasMatch(phone)) {
    return true;
  }
  return false;
}

bool checkEmail(String email) {
  RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (emailRegex.hasMatch(email)) {
    return true;
  }
  return false;
}

bool checkPassword(String password) {
  RegExp passwordRegex = RegExp(r'^[a-zA-Z0-9]+$');
  bool isValidPhoneNumber = passwordRegex.hasMatch(password);
  return isValidPhoneNumber;
}

bool checkLength(String string) {
  return string.length > 5 ? true : false;
}
