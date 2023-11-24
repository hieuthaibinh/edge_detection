import 'package:flutter/material.dart';

Future<void> showRegisterDialog(
  BuildContext context,
  AnimationController controller,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        content: Container(
          height: 375,
          child: Column(
            children: [
              Container(
                height: 210,
                //color: Colors.yellow,
                child: Image.asset('assets/images/success.png'),
              ),
              Container(
                //color: Colors.green,
                child: Text(
                  'Tạo mật khẩu thành công',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                //color: Colors.yellow,
                child: Text(
                  'Tài khoản của bạn đã sẵn sàng\nđược sử dụng. Chúng ta sẽ quay lại\ntrang chủ sau vài giây',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Color(0xff344054),
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RotationTransition(
                  turns:
                      CurvedAnimation(parent: controller, curve: Curves.easeIn),
                  child: Image.asset('assets/images/loading.png'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
