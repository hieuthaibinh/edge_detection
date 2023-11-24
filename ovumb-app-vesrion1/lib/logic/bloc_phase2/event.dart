// file này dùng để định nghĩa các event

abstract class Event {}


//event click vào nút Chi tiết để xem chi tiết các thông tin của thai nhi tại thời điểm chọn
class ChiTietThaiNhiEvent extends Event {
  final int clickEvent;
  ChiTietThaiNhiEvent(this.clickEvent);
}