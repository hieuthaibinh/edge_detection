import 'package:flutter_ovumb_app_version1/data/enum/test_result_enum.dart';

class TestLH {
  TestResultEnum checkLH(int lh) {
    if (lh <= 30) {
      return TestResultEnum.thap;
    } else if (lh <= 50) {
      return TestResultEnum.cao;
    } else {
      return TestResultEnum.datdinh;
    }
  }

  int getMaLoaiLH(int lh) {
    if (lh <= 30) {
      return 0;
    } else if (lh <= 50) {
      return 1;
    } else {
      return 2;
    }
  }
}
