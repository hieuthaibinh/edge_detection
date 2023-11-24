import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/enum/age_enum.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/cau_hoi.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/kinh_nguyet.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/auth/auth_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/synchronized/synchronized_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_state.dart';
import 'package:flutter_ovumb_app_version1/logic/calendar/calendar_generate.dart';
import 'package:flutter_ovumb_app_version1/logic/flow/flow_logic.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial(isLoading: false)) {
    final ServerRepository _serverRepository = ServerRepository();
    final LocalRepository _localRepository = LocalRepository();
    final KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
    final AuthRepository _authRepository = AuthRepository();
    final SynchronizedRepository _synchronizedRepository =
        SynchronizedRepository();

    // login
    on<AuthEventLogin>((event, emit) async {
      try {
        emit(AuthStateLoading(
          loadingText: 'Đang đăng nhập...',
          isLoading: true,
        ));

        bool login = await _authRepository.login(
          taiKhoan: event.taiKhoan,
          matKhau: event.matKhau,
        );
        await _localRepository.insertCauHoi(listCauHoi: listCauHoi);
        String? id = await SharedPreferencesService.getId();

        //kiểm tra login thành công hay chưa
        if (login && id != null) {
          List<KinhNguyet>? listKinhNguyet =
              await _serverRepository.getListKinhNguyet(maNguoiDung: id);

          //kiểm tra đã có kinh nguyệt hay chưa nếu có rồi thì đồng bộ vào local
          if (listKinhNguyet != null) {
            if (listKinhNguyet.isNotEmpty) {
              await _kinhNguyetRepository.insertListKinhNguyet(
                maNguoiDung: id,
                listKinhNguyet: listKinhNguyet,
                isSync: true,
              );

              await _synchronizedRepository.syncLuongKinhToLocal();
              await _synchronizedRepository.syncThaiKiToLocal();
              await _synchronizedRepository.syncNhatKyToLocal();
              await _synchronizedRepository.syncKetQuaTestToLocal();

              await SharedPreferencesService.setSync(true);
              NguoiDung nguoiDung = await _localRepository.getNguoiDung(id);
              emit(AuthStateLogged(
                nguoiDung: nguoiDung,
                phase: nguoiDung.phase!,
                isLoading: false,
              ));
            } else {
              NguoiDung nguoiDung = await _localRepository.getNguoiDung(id);
              AgeEnum ageEnum = FlowLogic().checkAge(nguoiDung.namSinh);
              emit(AuthStateLoggedNotInfor(ageEnum: ageEnum, isLoading: false));
            }
          } else {
            //chưa có cập nhật kinh nguyệt thì emit
            emit(
              AuthStateLoginFailure(
                isLoading: false,
                error: 'Lỗi kêt nối. Vui lòng kiểm tra lại kết nối mạng',
              ),
            );
          }
        }
      } catch (e) {
        emit(AuthStateLoginFailure(isLoading: false, error: e.toString()));
      }
    });

    //Đăng kí tài khoản
    on<AuthEventRegister>((event, emit) async {
      try {
        emit(AuthStateLoading(
          loadingText: 'Đang đăng ký...',
          isLoading: true,
        ));
        bool check = await _authRepository.register(
          taiKhoan: event.taiKhoan,
          matKhau: event.matKhau,
          tenNguoiDung: event.tenNguoiDung,
          email: event.email,
          namSinh: event.namSinh,
        );
        if (check) {
          emit(
            AuthStateRegisterSuccess(
              taiKhoan: event.taiKhoan,
              matKhau: event.matKhau,
              isLoading: false,
            ),
          );
        }
      } catch (e) {
        emit(
          AuthStateRegisterFailure(
            error: e.toString(),
            isLoading: false,
          ),
        );
      }
    });

    //Quên mật khẩu
    on<AuthEventResetPassword>((event, emit) async {
      try {
        emit(AuthStateLoading(
          loadingText: 'Đang gửi...',
          isLoading: true,
        ));
        final check = await _authRepository.resetPassword(email: event.email);
        if (check) {
          emit(AuthStateResetPaswordSuccess(isLoading: false));
        } else {
          emit(
            AuthStateResetPaswordFailure(
              error: 'Vui lòng nhập chính xác Email hoặc kiểm tra lại kết nối.',
              isLoading: false,
            ),
          );
        }
      } catch (e) {
        emit(
          AuthStateResetPaswordFailure(
            error: 'Vui lòng nhập chính xác Email hoặc kiểm tra lại kết nối.',
            isLoading: false,
          ),
        );
      }
    });

    //Đăng xuất tài khoản
    on<AuthEventLogout>((event, emit) async {
      String token = await SharedPreferencesService.getToken() ?? '';
      await SharedPreferencesService.removeToken();
      await SharedPreferencesService.removeId();
      await SharedPreferencesService.removeSync();
      await SharedPreferencesService.removeAds1();
      await SharedPreferencesService.removeAds2();
      await SharedPreferencesService.removeAds3();
      await _localRepository.deleteAll();
      emit(AuthStateLogout(isLoading: false));
      await _authRepository.logout(token: token);
    });

    //kiểm tra người dùng đã đăng nhập hay chưa
    on<AuthEventCheckLogin>((event, emit) async {
      try {
        emit(AuthStateLoading(
          loadingText: '',
          isLoading: false,
        ));
        String? maNguoiDung = await SharedPreferencesService.getId();
        if (maNguoiDung != null) {
          NguoiDung nguoiDung =
              await _localRepository.getNguoiDung(maNguoiDung);
          AgeEnum ageEnum = FlowLogic().checkAge(nguoiDung.namSinh);
          if (nguoiDung.phase != null) {
            int phase = nguoiDung.phase!;
            if ([1, 2, 5].contains(phase)) {
              // nếu đã đăng nhập rồi kiểm tra xem đã cập nhật kinh nguyệt hay chưa
              bool? checkSync = await SharedPreferencesService.getSync();
              if (checkSync == true) {
                emit(AuthStateLogged(
                  nguoiDung: nguoiDung,
                  phase: nguoiDung.phase!,
                  isLoading: false,
                ));
              } else {
                emit(AuthStateLoggedNotInfor(
                  ageEnum: ageEnum,
                  phase: nguoiDung.phase,
                  isLoading: false,
                ));
              }
            } else {
              emit(AuthStateLogged(
                nguoiDung: nguoiDung,
                phase: nguoiDung.phase!,
                isLoading: false,
              ));
            }
          } else {
            emit(AuthStateLoggedNotInfor(ageEnum: ageEnum, isLoading: false));
          }
        } else {
          emit(AuthStateLogout(isLoading: false));
        }
      } catch (e) {
        emit(AuthStateLoginFailure(isLoading: false));
      }
    });

    //người dùng lưu thông tin
    on<AuthEventInsertKinhNguyet>((event, emit) async {
      try {
        emit(AuthStateLoading(
          loadingText: 'Đang cập nhật...',
          isLoading: true,
        ));
        String? maNguoiDung = await SharedPreferencesService.getId();

        List<KinhNguyet>? listKinhNguyet = await _serverRepository
            .getListKinhNguyet(maNguoiDung: maNguoiDung!);

        if (listKinhNguyet != null) {
          if (listKinhNguyet.isEmpty) {
            List<KinhNguyet> listKinhNguyet = CalendarGenerate.generateListKN(
              maNguoiDung: maNguoiDung,
              kinhNguyet: event.kinhNguyet,
            );
            bool checkPhase =
                await _serverRepository.updatePhase(phase: event.phase);
            bool checkKN = await _serverRepository.insertListKinhNguyet(
              listKinhNguyet: listKinhNguyet,
            );

            if (checkPhase && checkKN) {
              await _kinhNguyetRepository.insertListKinhNguyet(
                maNguoiDung: maNguoiDung,
                listKinhNguyet: listKinhNguyet,
              );
              await _localRepository.updatePhase(event.phase);
              await SharedPreferencesService.setSync(true);

              NguoiDung nguoiDung =
                  await _localRepository.getNguoiDung(maNguoiDung);
              emit(AuthStateLogged(
                nguoiDung: nguoiDung,
                phase: nguoiDung.phase!,
                isLoading: false,
              ));
            } else {
              emit(AuthStateInsertKinhNguyetFailure(
                  error: 'Cập nhật thất bại. Vui lòng kiểm tra kết nối',
                  isLoading: false));
            }
          } else {
            await _kinhNguyetRepository.insertListKinhNguyet(
              maNguoiDung: maNguoiDung,
              listKinhNguyet: listKinhNguyet,
              isSync: true,
            );

            await _synchronizedRepository.syncLuongKinhToLocal();
            await _synchronizedRepository.syncThaiKiToLocal();
            await _synchronizedRepository.syncNhatKyToLocal();
            await _synchronizedRepository.syncKetQuaTestToLocal();

            await SharedPreferencesService.setSync(true);
            NguoiDung nguoiDung =
                await _localRepository.getNguoiDung(maNguoiDung);
            emit(AuthStateLogged(
              nguoiDung: nguoiDung,
              phase: nguoiDung.phase!,
              isLoading: false,
            ));
          }
        } else {
          emit(AuthStateInsertKinhNguyetFailure(
              error: 'Cập nhật thất bại. Vui lòng kiểm tra kết nối',
              isLoading: false));
        }
      } catch (e) {
        emit(AuthStateInsertKinhNguyetFailure(
            error: 'Cập nhật thất bại. Vui lòng kiểm tra kết nối',
            isLoading: false));
      }
    });
  }
}
