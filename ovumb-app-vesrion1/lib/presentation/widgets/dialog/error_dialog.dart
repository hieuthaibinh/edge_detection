import 'package:flutter/cupertino.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text, {
  String? title,
}) {
  return showGenericDialog(
    context: context,
    title: title ?? 'Thất Bại',
    content: text,
    titleColor: rose600,
    optionsBuilder: () => {
      'Xác nhận': null,
    },
  );
}
