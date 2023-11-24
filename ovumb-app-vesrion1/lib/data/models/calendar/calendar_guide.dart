//phần chú thích lịch
class CalendarGuide {
  final String iconUrl;
  final String text;

  CalendarGuide(this.iconUrl, this.text);
}

List<CalendarGuide> calendarGuide = [
  CalendarGuide('assets/icons/chu_thich1.png', 'Dự đoán kỳ kinh'),
  CalendarGuide('assets/icons/chu_thich2.png', 'Tình trạng kinh nguyệt'),
  CalendarGuide('assets/icons/chu_thich3.png', 'Dự đoán ngày rụng trứng'),
  CalendarGuide('assets/icons/chu_thich4.png', 'Nồng độ LH đạt đỉnh'),
  CalendarGuide('assets/icons/chu_thich5.png', 'Nồng độ LH cao'),
  CalendarGuide('assets/icons/chu_thich6.png', 'Nồng độ LH thấp'),
  CalendarGuide('assets/icons/chu_thich9.png', 'Cần test tính ngày an toàn'),
  CalendarGuide('assets/icons/chu_thich10.png', 'Ngày an toàn tương đối'),
  CalendarGuide('assets/icons/chu_thich11.png', 'Ngày an toàn tuyệt đối'),
  CalendarGuide('assets/icons/chu_thich12.png', 'Đã test tính ngày an toàn'),
];