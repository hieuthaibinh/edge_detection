import 'package:flutter/cupertino.dart';
import 'package:flutter_ovumb_app_version1/data/enum/test_result_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/test_lh.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

String checkLH(int lh) {
  if (TestLH().checkLH(lh) == TestResultEnum.thap) {
    return 'Thấp';
  } else if (TestLH().checkLH(lh) == TestResultEnum.cao) {
    return 'Cao';
  }
  return 'Đạt đỉnh';
}

Color buildDot(int lh) {
  if (TestLH().checkLH(lh) == TestResultEnum.thap) {
    return violet100;
  } else if (TestLH().checkLH(lh) == TestResultEnum.cao) {
    return violet200;
  }
  return violet300;
}
