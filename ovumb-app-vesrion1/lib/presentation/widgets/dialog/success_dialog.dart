import 'package:flutter/cupertino.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/generic_dialog.dart';

Future<void> showSuccessDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
    context: context,
    title: 'Thành công',
    content: text,
    titleColor: rose600,
    optionsBuilder: () => {
      'Xác nhận': null,
    },
  );
}
