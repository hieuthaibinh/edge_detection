import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/trieuchung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_state.dart';

class MilkBloc extends Bloc<MilkEvent, MilkState> {
  MilkBloc() : super(MilkInitialState(isLoading: false)) {
    MilkRepository _milkRepository = MilkRepository();

    // sự kiện kiểm tra xem đã tồn tại con chưa
    on<CheckBabyExistEvent>((event, emit) async {
      try {
        emit(LoadingState(
          loadingText: 'Đang tải dữ liệu...',
          isLoading: true,
        ));
        List<Con> listCon = await _milkRepository.get();

        if (listCon.isNotEmpty) {
          Con conFocus = listCon.first;
          for (Con con in listCon) {
            if (con.trangThai == 1) {
              conFocus = con;
            }
          }
          List<ChoAn>? choAn = await _milkRepository.getChoAnByDay(
              maCon: conFocus.id, date: DateTime.now());
          List<TrieuChung>? trieuChung = await _milkRepository.getTrieuChung(maCon: conFocus.id);
          List<PhatTrienCon> phatTrienCon =
              await _milkRepository.getPhatTrien(maCon: conFocus.id);
          if (choAn != null && trieuChung != null) {
            emit(BabyExistState(
              con: conFocus,
              phatTrienCon: phatTrienCon,
              choAn: choAn,
              trieuChung: trieuChung,
              isLoading: false,
            ));
          } else {
            emit(LoadingFailureState(
                error: 'Lỗi kết nối mạng. Kiểm tra lại kết nối',
                isLoading: false));
          }
        } else {
          emit(BabyNotExistState(isLoading: false));
        }
      } catch (e) {
        emit(LoadingFailureState(
            error: 'Lỗi kết nối mạng. Kiểm tra lại kết nối', isLoading: false));
      }
    });

    // sự kiện update con vào server
    on<UpdateBabyEvent>((event, emit) async {
      try {
        emit(LoadingState(
          loadingText: 'Đang cập nhật...',
          isLoading: true,
        ));
        bool check = await _milkRepository.update(con: event.con);
        if (check) {
          emit(UpdateBabySuccessState(isLoading: false));
        } else {
          emit(UpdateBabyFailureState(isLoading: false));
        }
      } catch (e) {
        emit(LoadingFailureState(
          error: 'Cập nhật không thành công. Kiểm tra lại kết nối mạng',
          isLoading: false,
        ));
      }
    });

    // vào màn thêm bé
    on<AddBabyEvent>((event, emit) {
      emit(BabyNotExistState(
        isAdd: true,
        isLoading: false,
      ));
    });

    // vào màn cho an
    on<CheckChoAnEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<ChoAn>? choAn = await _milkRepository.getChoAnByDay(
            maCon: event.maCon, date: event.date);
        if (choAn != null) {
          emit(ChoAnState(isLoading: false, listChoAn: choAn));
        } else {
          emit(LoadingFailureState(
              error: 'Lỗi kết nối mạng. Kiểm tra lại kết nối',
              isLoading: false));
        }
      } catch (e) {
        emit(LoadingFailureState(
            error: 'Lỗi kết nối mạng. Kiểm tra lại kết nối', isLoading: false));
      }
    });
  }
}
