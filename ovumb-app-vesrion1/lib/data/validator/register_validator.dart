import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/validator/validator.dart';

String? registerValidator(List<TextEditingController> _listController) {
  var _password = _listController[4].text;
  var _confirmPassword = _listController[5].text;
  if (checkEmpty(_listController)) {
    if (!checkPhoneNumber(_listController[1].text)) {
      return 'Số điện thoại không hợp lệ';
    } else if (!checkPassword(_listController[4].text)) {
      return 'Mật khẩu không được chứa kí tự đặc biệt';
    } else if (!checkLength(_listController[4].text)) {
      return 'Mật khẩu phải có độ dài từ 6 kí tự trở lên';
    } else if (_password != _confirmPassword) {
      return 'Mật khẩu không khớp';
    } else if (!checkBirth(_listController[3].text)) {
      return 'Năm sinh không hợp lệ';
    } else if (!checkEmail(_listController[2].text)) {
      return 'Email không hợp lệ';
    } else if (_listController[0].text.trim().length > 30) {
      return 'Họ và tên vượt quá độ dài';
    } else {
      return null;
    }
  }
  return 'Vui lòng nhập đủ thông tin';
}

String? changePasswordValidator(List<TextEditingController> _listController) {
  var _password = _listController[1].text;
  var _confirmPassword = _listController[2].text;
  if (checkEmpty(_listController)) {
    if (!checkLength(_listController[1].text)) {
      return 'Mật khẩu phải có độ dài từ 6 kí tự trở lên';
    } else if (_password != _confirmPassword) {
      return 'Mật khẩu không khớp';
    } else {
      return null;
    }
  }
  return 'Vui lòng nhập đủ thông tin';
}

String? updateProfileValidator(List<TextEditingController> _listController) {
  if (checkEmpty(_listController)) {
    if (!checkCanNang(_listController[1].text)) {
      return 'Cân nặng không hợp lệ';
    } else if (!checkChieuCao(_listController[2].text)) {
      return 'Chiều cao không hợp lệ';
    } else {
      return null;
    }
  }
  return 'Vui lòng nhập đủ thông tin';
}

bool checkEmpty(List<TextEditingController> listController) {
  for (TextEditingController controller in listController) {
    if (controller.text.trim().isEmpty) {
      return false;
    }
  }
  return true;
}

String? babyUpdateValidator(List<TextEditingController> _listController) {
  if (checkEmpty(_listController)) {
    if (_listController[0].text.trim().length > 20) {
      return 'Vui lòng nhập tên không quá 20 kí tự';
    }
    return null;
  }
  return 'Vui lòng nhập đủ thông tin';
}
