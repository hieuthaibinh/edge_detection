import 'package:flutter/material.dart';

Future<void> showNotificationDialog(
  BuildContext context,
  String title,
  String subTitle,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        content: Container(
          height: 330,
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
                  title,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                //color: Colors.yellow,
                child: Text(
                  subTitle,
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
            ],
          ),
        ),
      );
    },
  );
}
