import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/enum/test_result_enum.dart';
import 'package:flutter_ovumb_app_version1/data/handle/test_lh.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/guide.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/quan_ly_que_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/test_resutl.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/ketquatest/ketquatest_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/link/link_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/thaiki/thaiki_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_state.dart';
import 'package:flutter_ovumb_app_version1/logic/test/image_analyze.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/result_test.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestStateInitial(isLoading: false)) {
    final ServerRepository _serverRepository = ServerRepository();
    final KetQuaTestRepository _ketQuaTestRepository = KetQuaTestRepository();
    final KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
    final ThaiKiRepository _thaiKiRepository = ThaiKiRepository();
    final LinkRepository _linkRepository = LinkRepository();
    final TestLH _testLH = TestLH();
    final ImageAnalyze _imageAnalyze = ImageAnalyze();

    on<TestSubmitLHEvent>((event, emit) async {
      try {
        emit(TestStateLoading(isLoading: true));
        int? lh = await _imageAnalyze.splitImage(event.image);
        if (lh != null) {
          int currentLH = lh;
          if (currentLH >= 0 && currentLH <= 1) {
            currentLH = 3;
          } else if (currentLH > 80 || currentLH < 0) {
            currentLH = 80;
          }
          KinhNguyet kinhNguyet =
              await _kinhNguyetRepository.getKinhNguyet(trangThai: 1);
          final id = await SharedPreferencesService.getId();
          NguoiDung nguoiDung = await LocalRepository().getNguoiDung(id!);
          if (event.maLoaiQue == 1) {
            TestResult? testResult = await _serverRepository.insertKetQuaTest(
              maQuanLyQueTest: event.maQuanLyQueTest,
              maLoaiQue: event.maLoaiQue,
              date: DateTime.now(),
              ketQua: currentLH,
              phase: nguoiDung.phase!,
              testEnum: _testLH.getMaLoaiLH(lh),
              firstDate: kinhNguyet.ngayBatDau!.millisecondsSinceEpoch,
              endDate: DateTime.now().millisecondsSinceEpoch,
            );

            if (testResult != null) {
              await _ketQuaTestRepository.insertKetQuaTest(
                ketQuaTest: KetQuaTest(
                  maKetQuaTest: 0,
                  maLoaiQue: event.maLoaiQue,
                  lanTest: 1,
                  thoiGian: DateTime.now(),
                  ketQua: currentLH,
                ),
              );
              int tbnknNew = 21;
              if (_testLH.checkLH(currentLH) == TestResultEnum.datdinh) {
                tbnknNew = await _kinhNguyetRepository.resetCKKNAfterTest(
                    tbnknNew: tbnknNew);
              }
              emit(TestStateResultSuccess(
                result: testResult,
                maKetQuaTest: testResult.maKetQuaTest,
                lh: currentLH,
                tbnknNew: tbnknNew,
                isLoading: false,
                position: 0,
              ));
            } else {
              emit(TestResultStateFailure(
                  result: testResultFailure, isLoading: false));
            }
          } else {
            //test que thử thai
            TestResult? testResult = await _serverRepository.insertKetQuaTest(
              maQuanLyQueTest: event.maQuanLyQueTest,
              maLoaiQue: event.maLoaiQue,
              date: DateTime.now(),
              ketQua: currentLH.toInt(),
            );
            if (testResult != null) {
              //nếu thấp thì chưa có thai, ngược lại cao hoặc đạt đỉnh thì có
              if (_testLH.checkLH(currentLH) == TestResultEnum.thap) {
              } else {
                bool check = await _thaiKiRepository.insertNgayDuSinh();
                if (check) {
                  emit(TestStateResultThaiSuccess(
                    result: testResult,
                    isLoading: false,
                  ));
                } else {
                  emit(TestResultStateFailure(
                      result: testResultFailure, isLoading: false));
                }
              }
            } else {
              emit(TestResultStateFailure(
                  result: testResultFailure, isLoading: false));
            }
          }
        } else {
          emit(TestResultStateFailure(
              result: testScanFailure, isLoading: false));
        }
      } catch (e) {
        emit(TestResultStateFailure(
            result: testResultFailure, isLoading: false));
      }
    });

    // sự kiện check số lượng que test
    on<TestCheckEvent>((event, emit) async {
      try {
        emit(TestStateLoading(isLoading: true));
        QuanLyQueTest? quanLyQueTest =
            await _serverRepository.getQuanLyQueTest();
        List<Guide>? videos = await _linkRepository.getGuideVideos();
        List<Guide>? images = await _linkRepository.getGuideImages();
        if (quanLyQueTest != null && videos != null && images != null) {
          emit(
            TestStateHasQueTest(
              quanLyQueTest: quanLyQueTest,
              videos: videos,
              images: images,
              isLoading: false,
            ),
          );
        } else if (videos != null && images != null) {
          emit(
            TestStateHasQueTest(
              quanLyQueTest: QuanLyQueTest(
                soLuongQueThai: 0,
                soLuongQueTrung: 0,
                tongQueThai: 0,
                tongQueTrung: 0,
              ),
              videos: videos,
              images: images,
              isLoading: false,
            ),
          );
        } else {
          emit(TestStateFailure(error: 'Lỗi kết nối', isLoading: false));
        }
      } catch (e) {
        emit(TestStateFailure(error: 'Lỗi kết nối', isLoading: false));
      }
    });

    // sự kiện check số lượng que test
    on<TestOpenQREvent>((event, emit) async {
      emit(TestStateOpenQRTest(isLoading: false));
    });

    on<TestQRSubmitEvent>((event, emit) async {
      try {
        emit(TestStateLoading(isLoading: true));
        bool check = await _serverRepository.updateHopTest(
          maHopTest: event.qrcode!,
          date: DateTime.now(),
        );
        if (check) {
          emit(TestStateQRSubmitSuccess(isLoading: false));
        } else {
          emit(TestStateQRSubmitFailure(
              error: 'Hộp test đã được sử dụng', isLoading: false));
        }
      } catch (e) {
        emit(TestStateQRSubmitFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện get guide
    on<TestGuideEvent>((event, emit) async {
      try {
        emit(TestStateLoading(isLoading: true));
        List<Guide>? videos = await _linkRepository.getGuideVideos();
        List<Guide>? images = await _linkRepository.getGuideImages();

        if (videos != null && images != null) {
          emit(
              TestStateGuide(videos: videos, images: images, isLoading: false));
        } else {
          emit(TestStateQRSubmitFailure(
              error: 'Lỗi kết nối mạng. Vui lòng thử lại', isLoading: false));
        }
      } catch (e) {
        emit(TestStateQRSubmitFailure(
            error: 'Lỗi kết nối mạng. Vui lòng thử lại', isLoading: false));
      }
    });
  }
}
