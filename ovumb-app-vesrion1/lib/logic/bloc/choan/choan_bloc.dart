import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/choan_chart.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';

import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_state.dart';

class ChoAnBloc extends Bloc<ChoAnEvent, ChoAnState> {
  ChoAnBloc() : super(ChoAnInitialState(isLoading: false)) {
    MilkRepository _milkRepository = MilkRepository();

    // khoi tao
    on<ChoanInitialEvent>((event, emit) async {
      emit(ChoAnInitialState(isLoading: false));
    });

    // get lich su bu binh
    on<BuMeHistoryEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<ChoAn>? listChoAn = await _milkRepository.getChoAnHistory(
          maCon: event.maCon,
          maLoaiChoAn: [getMaChoAn(ChoAnEnum.bume)],
        );
        List<ChoAn>? listChoAnByDay = await _milkRepository.getChoAnNgayTao(
          maCon: event.maCon,
          maLoaiChoAn: [getMaChoAn(ChoAnEnum.bume)],
          date: DateTime.now(),
        );
        if (listChoAn != null && listChoAnByDay != null) {
          emit(BuMeHistoryState(
            chartDataChoAn:
                ChoanChart().handleDataChoAn(listChoAn, ChoAnEnum.bume),
            choAn: listChoAnByDay,
            isLoading: false,
          ));
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

    // get lich su bu binh
    on<BuBinhHistoryEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<ChoAn>? listChoAn = await _milkRepository.getChoAnHistory(
          maCon: event.maCon,
          maLoaiChoAn: [
            getMaChoAn(ChoAnEnum.suacongthuc),
            getMaChoAn(ChoAnEnum.suame)
          ],
        );

        List<ChoAn>? listChoAnByDay = await _milkRepository.getChoAnNgayTao(
          maCon: event.maCon,
          maLoaiChoAn: [
            getMaChoAn(ChoAnEnum.suacongthuc),
            getMaChoAn(ChoAnEnum.suame)
          ],
          date: DateTime.now(),
        );

        if (listChoAn != null && listChoAnByDay != null) {
          emit(BuBinhHistoryState(
            chartDataChoAn:
                ChoanChart().handleDataChoAn(listChoAn, ChoAnEnum.suacongthuc),
            isLoading: false,
            choAn: listChoAnByDay,
          ));
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

    // get lich su an dam
    on<AnDamHistoryEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<ChoAn>? listChoAn = await _milkRepository.getChoAnHistory(
          maCon: event.maCon,
          maLoaiChoAn: [getMaChoAn(ChoAnEnum.andam)],
        );

        List<ChoAn>? listChoAnByDay = await _milkRepository.getChoAnNgayTao(
          maCon: event.maCon,
          maLoaiChoAn: [getMaChoAn(ChoAnEnum.andam)],
          date: DateTime.now(),
        );

        if (listChoAn != null && listChoAnByDay != null) {
          emit(AnDamHistoryState(
            chartDataChoAn:
                ChoanChart().handleDataChoAn(listChoAn, ChoAnEnum.andam),
            isLoading: false,
            choAn: listChoAnByDay,
          ));
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

    // get lich su bu binh
    on<KichSuaEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<HutSua>? listHutSua = await _milkRepository.getHutSuaHistory();
        List<HutSua>? listHutSuaByDay =
            await _milkRepository.getHutSuaNgayTao(date: DateTime.now());
        if (listHutSua != null && listHutSuaByDay != null) {
          emit(
            KichSuaState(
              isLoading: false,
              chartDataHistory: ChoanChart().handleDataHutSua(listHutSua),
              chartDataByDay: ChoanChart().handleDataHutSuaByDay(listHutSuaByDay),
              hutSua: listHutSuaByDay,
            ),
          );
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
