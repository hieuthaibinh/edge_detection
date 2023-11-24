final List<String> listImageCanhBaoCham = [
  'assets/images/phase5_cbc1.png',
  'assets/images/phase5_cbc2.png',
  'assets/images/phase5_cbc3.png',
  'assets/images/phase5_cbc4.png',
  'assets/images/phase5_cbc5.png',
];

// Danh sách các câu hỏi
final List<String> listTitleCanhBaoCham = [
  'Báo động nhìn',
  'Báo động nói',
  'Báo động chạm',
  'Báo động một mình',
  'Báo động ôm',
];

// Danh sách các câu trả lời
final List<String> listContentCanhBaoCham = [
  'Người đó nhìn vào vùng đồ lót của con hoặc dụ dỗ con nhìn vào vùng đồ lót của họ. Người đó cho con xem những sách báo, tranh ảnh có nội dung nhạy cảm.',
  'Người đó nói với con những từ ngữ liên quan đến vùng đồ lót.',
  'Người đó đụng chạm, sờ mó vào vùng đồ lót của con và dụ dỗ con đụng chạm vào vùng đồ lót của họ.',
  'Người đó thường xuất hiện khi con một mình hay lôi kéo con đến nơi vắng người.',
  'Người đó có những cử chỉ gần gũi và cái ôm khiến con khó chịu.',
];

// Danh sách check câu hỏi đang được mở hay đóng
List<bool> listCheckCanhBaoCham =
    List.filled(listTitleCanhBaoCham.length, false);

final List<String> listImageQuyTac = [
  'assets/images/phase5_cbc1.png',
  'assets/images/phase5_cbc2.png',
  'assets/images/phase5_cbc3.png',
  'assets/images/phase5_cbc4.png',
  'assets/images/phase5_cbc5.png',
];

// Danh sách các câu hỏi
final List<String> listTitleQuyTac = [
  'Quy tắc 1',
  'Quy tắc 2',
  'Quy tắc 3',
  'Quy tắc 4',
  'Quy tắc 5',
];

// Danh sách các câu trả lời
final List<String> listContentQuyTac = [
  'Không mở cửa cho người lạ',
  'Không lên xe với người lạ',
  'Không đi theo người lạ',
  'Không nhận đồ từ người lạ',
  'Không đi chơi 1 mình hoặc tách khỏi bố mẹ',
];

// Danh sách check câu hỏi đang được mở hay đóng
List<bool> listCheckQuyTac = List.filled(listTitleQuyTac.length, false);

final List<String> listImageMun = [
  'assets/images/phase5_mun1.png',
  'assets/images/phase5_mun2.png',
  'assets/images/phase5_mun3.png',
  'assets/images/phase5_mun4.png',
  'assets/images/phase5_mun5.png',
];

// Danh sách các câu hỏi
final List<String> listTitleMun = [
  'Bước 1',
  'Bước 2',
  'Bước 3',
  'Bước 4',
  'Bước 5',
];

// Danh sách các câu trả lời
final List<String> listContentMun = [
  'Lau sạch mặt bằng nước muối sinh lý sau khi đi học hoặc đi chơi về.',
  'Rửa mặt bằng sữa rửa mặt để loại bỏ bụi bẩn, nước mát còn có tác dụng se khít lỗ chân lông.',
  'Rửa sạch mặt với nước và thấm khô mặt bằng bông tẩy trang.',
  'Bôi kem trị mụn Renoil (Lưu ý: sử dụng các loại kem bôi uy tín).',
  'Không nên ăn đồ cay nóng, uống nước có gas và ăn đồ chiên rán. Cứ 1 cốc Coca và 1 đùi gà KFC sẽ đem đến cho các bạn 10 mụn ẩn và 2 mụn bọc đấy nhé. Các bạn lưu ý bỏ đồ ăn nhanh và thay bằng rau củ quả và hoa quả nhé.',
];

// Danh sách check câu hỏi đang được mở hay đóng
List<bool> listCheckMun = List.filled(listTitleMun.length, false);

final List<String> listImageMuiCoThe = [
  'assets/images/phase5_mui1.png',
  'assets/images/phase5_mui2.png',
  'assets/images/phase5_mui3.png',
];

// Danh sách các câu hỏi
final List<String> listTitleMuiCoThe = [
  'Bước 1',
  'Bước 2',
  'Bước 3',
];

// Danh sách các câu trả lời
final List<String> listContentMuiCoThe = [
  'Tắm thường xuyên, dùng lăn khử mùi sau khi tắm, vệ sinh răng miệng.',
  'Giặt quần áo thường xuyên, dùng nước xả vải.',
  'Uống ít nhất 2 lít nước mỗi ngày và trà mát gan trị mụn LivUp để thanh lọc cơ thể. Không ăn đồ cay nóng',
];

// Danh sách check câu hỏi đang được mở hay đóng
List<bool> listCheckMuiCoThe = List.filled(listTitleMuiCoThe.length, false);

List<List<String>> listImageGDGT = [
  listImageCanhBaoCham,
  listImageQuyTac,
  listImageMun,
  listImageMuiCoThe,
];

List<List<String>> listTitleGDGT = [
  listTitleCanhBaoCham,
  listTitleQuyTac,
  listTitleMun,
  listTitleMuiCoThe,
];

List<List<String>> listContentGDGT = [
  listContentCanhBaoCham,
  listContentQuyTac,
  listContentMun,
  listContentMuiCoThe,
];

List<List<bool>> listCheckGDGT = [
  listCheckCanhBaoCham,
  listCheckQuyTac,
  listCheckMun,
  listCheckMuiCoThe,
];