
// Danh sách các câu hỏi
final List<String> listQuestion = [
  'Tôi có cần sử dụng hết các que test không?',
  'Tôi nên tiếp tục test sau lần test đầu bao lâu?"',
  'Chu kỳ kinh của tôi không đều, OvumB có thể theo dõi chính xác giúp tôi không?',
  'Tôi có thể sử dụng kết quả tính ngày rụng trứng như biện pháp tránh thai không?',
  'Uống nhiều nước trước khi test có gây ảnh hưởng đến kết quả không?',
  'Trong quá trình test, tôi sử dụng thêm một số loại thuốc khác thì kết quả có bị ảnh hưởng không?',
];

// Danh sách các câu trả lời
final List<String> listAnswer = [
  'Không. Bạn có thể ngừng test khi phát hiện LH tăng cao và hãy lưu trữ các que còn lại cho lần sử dụng sau nếu cần.',
  'Bạn hãy bắt đầu test từ ngày đầu tiên của cửa sổ thụ thai trong chu kỳ mỗi tháng. Khi phần mềm ghi nhận kết quả nồng độ LH CAO, hãy test liên tục mỗi 4h một lần cho đến khi kết quả nồng độ LH ĐẠT ĐỈNH.  ',
  'Có, OvumB hoàn toàn có thể giúp được bạn. Bạn chỉ cần nhập thông tin về chu kỳ kinh nguyệt, OvumB sẽ tính toán và chủ động nhăc bạn về những thời điểm quan trọng như ngày hành kinh, ngày rụng trứng,...',
  'Không. Vì tinh trùng có thể sống sót trong vài ngày, vậy nên dựa vào kết quả này để tránh thai là rất khó. ',
  'Uống nhiều nước có thể làm nước tiểu bị loãng. Điều này ảnh hưởng tơi nồng độ LH thực tế. Do đó, bạn không nên uống quá nhiều nước trước khi thực hiện test.',
  'Chắc chắn là có. Sử dụng thuốc sẽ khiến nội tiết trong cơ thể bạn bị thay đổi, bao gồm cả nồng độ LH. Tốt hơn hết, nếu bạn đang sử dụng thuốc mà có ý định test, bạn hãy hỏi ý kiến của chuyên gia nhé.',
];

// Danh sách check câu hỏi đang được mở hay đóng
List<bool> listCheck = List.filled(listQuestion.length, false);