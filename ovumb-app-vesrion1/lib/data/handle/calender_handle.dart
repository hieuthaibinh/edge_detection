// datetime to string
import 'package:intl/intl.dart';

// chuyển date sang String
String formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

//chuyển câu trả lời thành list
List<String> spiltAnswer(String cauTraLoi) {
  return cauTraLoi.split(';');
}

//chuyển list câu trả lời thành string
String joinAnswer(List<String> cauTraLoi) {
  return cauTraLoi.join(';');
}

void main() {
}