// file này dùng để code business logic
// nhận event từ UI => xử lý event và truyền state lại cho UI

import 'dart:async';
import 'event.dart';
import 'state.dart';

class Bloc {
  var luuState = ChiTietThaiNhiState(0);
  final LuuEventController = StreamController<Event>();
  final LuuStateController = StreamController<ChiTietThaiNhiState>();

  Bloc() {
    //lắng nghe khi LuuEventController push event mới
    LuuEventController.stream.listen((Event event) {
      if (event is ChiTietThaiNhiEvent) {
        luuState = ChiTietThaiNhiState(luuState.clickState);
      } else {
        luuState = ChiTietThaiNhiState(0);
      }
      //add state mới vào LuuStateController để bên Ui nhận được
      LuuStateController.sink.add(luuState);
    });
  }
  //khi không cần thiết thì đóng hết tất cả các controller
  void dispose() {
    LuuEventController.close();
    LuuStateController.close();
  }
}
