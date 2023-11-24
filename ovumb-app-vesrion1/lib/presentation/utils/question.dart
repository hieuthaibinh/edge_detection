//question 1
final List<String> one = [
  'Chưa có con',
  '1 con',
  '2 con',
  '3 con',
  'Nhiều hơn 4',
];
var oneValue = '';
String oneText = 'Bạn có bao nhiêu con rồi? (1/8)';

//question 2
final List<String> two = [
  'Bình thường',
  'U nang buồng trứng',
  'Hội chứng buồn trứng đa năng (PCOS)',
  'Lạc nội mạc tử cung',
  'U xơ tử cung',
  'Rối loạn hormone',
  'Suy buồng trứng sớm (POF)',
  'Tắc ống dẫn trứng',
  'Tiểu đường',
  'Cao huyết áp',
  'Khác',
];
final List<bool> twoValue = List.filled(two.length, false);
String twoText = 'Tình trạng sức khỏe của bạn hiện nay ra sao? (2/8)';

//question 3
final List<String> three = [
  'Tôi chưa bao giờ mang thai',
  'Tôi đã sinh con',
  'Tôi mang thai một cách bình thường',
  'Tôi đã bị sảy thai',
  'Tôi không muốn trả lời'
];
final List<bool> threeValue = List.filled(three.length, false);
String threeText = 'Trải nghiệm mang thai của bạn như thế nào? (3/8)';

//question 4
final List<String> four = [
  'Có, chu kỳ bình thường',
  'Không, cứ sau ba tháng lại trễ',
  'Không, cứ sau sáu tháng lại trễ',
  'Không, cứ sau một năm lại trễ',
];
var fourValue = '';
String fourText = 'Chu kỳ kinh nguyệt của bạn có bình thường không? (4/8)';

//question 5
final List<String> five = [
  'Chưa',
  'Có, chưa đến bốn lần một năm',
  'Có, từ bốn lần trở lên một năm',
];
var fiveValue = '';
String fiveText = 'Bạn đã bao giờ bị viêm đường tiết niệu chưa? (5/8)';

//question 6
final List<String> six = [
  'Không',
  'Có, lần nào cũng bị',
  'Có, thỉnh thoảng bị',
  'Khác',
];
var sixValue = '';
String sixText = 'Bạn có ra máu nhẹ giữa hai kì kinh nguyệt không? (6/8)';

//question 7
final List<String> seven = [
  'Không',
  'Thuốc tránh thai',
  'Thuốc tránh thai khẩn cấp',
  'Bao cao su',
  'Vòng tránh thai (IUD)',
  'Khác',
];
final List<bool> sevenValue = List.filled(seven.length, false);
String sevenText = 'Bạn có ra máu nhẹ giữa hai kì kinh nguyệt không? (7/8)';

//question 8
final List<String> eight = [
  '1. Bình thường',
  '2. Vô sinh hoặc Vô sinh thứ phát',
  '3. Không có tinh trùng di động',
  '4. Tắc ống dẫn tinh',
  '5. Mất cân bằng hormone',
  '6. Giãn tĩnh mạch thừng tinh',
  '7. Rối loạn chức năng sinh lý',
  '8. Vô sinh miễn dịch',
  '9. Các bệnh sinh lý khác',
];
final List<bool> eightValue = List.filled(eight.length, false);
String eightText =
    'Tình trạng sức khỏe hiện tại của bạn đời như thế nào? (8/8)';

//list date of birth
final List<String> listDateOfBirth = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2006',
  '2007',
  '2008'
];
String? selectedDateOfBirth = '';