import 'package:intl/intl.dart';

class DateTimeHandle {

  //format về đầu ng
  int dateStartFormat(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd 00:00:00.000');
    return DateTime.parse(formatter.format(dateTime)).millisecondsSinceEpoch;
  }
}
