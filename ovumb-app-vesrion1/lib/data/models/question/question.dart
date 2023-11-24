// ignore_for_file: public_member_api_docs, sort_constructors_first

class Question {
  final String title;
  final String sub;
  Question({
    required this.title,
    required this.sub,
  });
}

List<Question> listQuestion = [
  Question(
    title: 'Độ dài trung bình của chu kỳ kinh',
    sub: ' ngày',
  ),
  Question(
    title: 'Số ngày có kinh',
    sub: ' ngày',
  ),
  Question(
    title: 'Ngày bắt đầu có kinh gần nhất',
    sub: ' ngày',
  ),
  Question(
    title: 'Chu kỳ kinh ngắn nhất',
    sub: ' ngày',
  ),
  Question(
    title: 'Chu kỳ kinh dài nhất',
    sub: ' ngày',
  ),
];
