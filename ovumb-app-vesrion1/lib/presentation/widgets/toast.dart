import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(BuildContext context, String text, {int? seconds}) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(38),
      color: Colors.black,
    ),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: whiteColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: seconds ?? 2),
  );
}

//show toast cua gio hang
showStoreSuccessToast(BuildContext context, String text, {int? seconds}) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.black.withOpacity(0.5),
    ),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        height: 75,
        child: Column(
          children: [
            Image.asset(
              'assets/stores/success_icon.png',
              scale: 3,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: whiteColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: seconds ?? 2),
  );
}
