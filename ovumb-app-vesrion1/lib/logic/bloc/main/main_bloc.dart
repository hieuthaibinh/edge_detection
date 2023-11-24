import 'package:flutter_ovumb_app_version1/data/local_data/repositories/local/local_repository.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/type_blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/ket_qua_test.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/link.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/thai_ki.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/kinhnguyet/kinhnguyet_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/link/link_repository.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/tvv/tvv_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainStateInitial(isLoading: false)) {
    final LocalRepository _localRepository = LocalRepository();
    final ServerRepository _serverRepository = ServerRepository();
    final KinhNguyetRepository _kinhNguyetRepository = KinhNguyetRepository();
    final TvvRepository _tvvRepository = TvvRepository();
    final LinkRepository _linkRepository = LinkRepository();
    // sự kiện ấn vào nút home
    on<HomeEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        final user = await _localRepository.getNguoiDung(event.id);
        final listCauHoi = await _localRepository.getListCauHoi();
        emit(
          HomeState(
            nguoiDung: user,
            listCauHoi: listCauHoi,
            phase: user.phase!,
            isLoading: false,
          ),
        );
      } catch (e) {
        //emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện ấn vào nút chart
    on<ChartEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<KetQuaTest> ketQuaTest = await _serverRepository.getKetQuaTest();
        if (state is LoadingState) {
          emit(ChartState(ketQuaTest: ketQuaTest, isLoading: false));
        }
      } catch (e) {}
    });

    // sự kiện ấn vào nút calendar
    on<CalendarEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        final user = await _localRepository.getNguoiDung(event.id);
        final listCauHoi = await _localRepository.getListCauHoi();

        emit(
          CalendarState(
            nguoiDung: user,
            listCauHoi: listCauHoi,
            isLoading: false,
          ),
        );
      } catch (e) {
        //emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện ấn vào nút calendar
    on<ProfileEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        final user = await _localRepository.getNguoiDung(event.id);
        final kinhNguyetCurrent =
            await _kinhNguyetRepository.getKinhNguyet(trangThai: 1);

        emit(
          ProfileState(
            isLoading: false,
            nguoiDung: user,
            kinhNguyetCurrent: kinhNguyetCurrent,
          ),
        );
      } catch (e) {
        //emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện ấn vào nút edit profile
    on<ProfileEditEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        final user = await _localRepository.getNguoiDung(event.id);

        emit(
          ProfileEditState(
            isLoading: false,
            nguoiDung: user,
          ),
        );
      } catch (e) {
        //emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện update profile
    on<ProfileUpdateEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));

        final checkServer = await _serverRepository.updateNguoiDung(
          tenNguoiDung: event.nguoiDung.tenNguoiDung,
          canNang: event.nguoiDung.canNang!,
          chieuCao: event.nguoiDung.chieuCao!,
        );

        if (checkServer) {
          final checkLocal =
              await _localRepository.updateNguoiDung(event.nguoiDung);
          if (checkLocal) {
            emit(
              ProfileUpdateSuccessState(
                isLoading: false,
                nguoiDung: event.nguoiDung,
              ),
            );
          } else {
            emit(ProfileUpdateFailureState(
                isLoading: false, error: 'Cập nhật thông tin thất bại'));
          }
        } else {
          emit(ProfileUpdateFailureState(
              isLoading: false, error: 'Cập nhật thông tin thất bại'));
        }
      } catch (e) {
        emit(ProfileUpdateFailureState(isLoading: false, error: e.toString()));
      }
    });

    // sự kiện vào màn hình ngày dự sinh
    on<NgayDuSinhCheckEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        ThaiKi thaiKi = await _localRepository.getThaiKi(maNguoiDung: event.id);
        if (thaiKi.ngayDuSinh != null) {
          emit(NgayDuSinhHasExistState(
              ngayDuSinh: thaiKi.ngayDuSinh!, isLoading: false));
        } else {
          emit(NgayDuSinhHasNotExistState(isLoading: false));
        }
      } catch (e) {
        emit(NgayDuSinhHasNotExistState(isLoading: false));
      }
    });

    // sự kiện insert ngày dự sinh
    on<NgayDuSinhInsertEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        bool check = await _localRepository.insertThaiKi(thaiKi: event.thaiKi);
        if (check) {
          emit(NgayDuSinhHasExistState(
              ngayDuSinh: event.thaiKi.ngayDuSinh!, isLoading: false));
        } else {
          emit(LoadFailure(
              error: 'Lưu ngày dự sinh thất bại', isLoading: false));
        }
      } catch (e) {
        emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện lấy blog
    on<AllBlogEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<TypeBlog> types =
            await _serverRepository.getListBlogType(phase: event.phase);
        if (types.isNotEmpty) {
          List<List<Blog>> listBlogs = [];
          for (int i = 0; i < types.length; i++) {
            List<Blog> blogs =
                await _serverRepository.getListBlog(id: types[i].id);
            listBlogs.add(blogs);
          }
          for (int i = 0; i < types.length; i++) {
            if (listBlogs[i].isEmpty) {
              listBlogs.removeAt(i);
              types.removeAt(i);
            }
          }
          if (listBlogs.isNotEmpty) {
            emit(
              AllBlogState(
                isLoading: false,
                listType: types,
                listBlogs: listBlogs,
              ),
            );
          } else {
            emit(HasNoBlogState(isLoading: false));
          }
        } else {
          emit(HasNoBlogState(isLoading: false));
        }
      } catch (e) {
        emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện lấy blog da liễu
    on<Phase5BlogEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<Blog> blogs = await _serverRepository.getListBlog(id: 44);
        if (blogs.isNotEmpty) {
          emit(
            Phase5BlogState(
              isLoading: false,
              listType: [TypeBlog(id: 5, type: 'Tuổi Vị Thành Niên')],
              listBlogs: [blogs],
            ),
          );
        } else {
          emit(HasNoBlogState(isLoading: false));
        }
      } catch (e) {
        emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện lấy tvv
    on<TvvEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        int type = 4;
        if (event.phase == 1) {
          type = 24;
        } else if (event.phase == 2) {
          type = 4;
        } else if (event.phase == 3) {
          type = 14;
        }
        List<TVV> listTVV = await _tvvRepository.getListTvvByUser(type: type);
        emit(TvvState(isLoading: false, listTvv: listTVV));
      } catch (e) {
        emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });

    // sự kiện lấy link hội
    on<AllGroupEvent>((event, emit) async {
      try {
        emit(LoadingState(isLoading: true));
        List<List<Link>> listLink = [];
        List<List<int>> groups = [
          [3, 1, 2, 4],
          [1, 2, 3, 4],
          [4, 1, 2, 3],
        ];
        List<int> requests = groups[event.phase - 1];
        for (int i = 0; i < requests.length; i++) {
          List<Link> links = await _linkRepository.getLink(type: requests[i]);
          listLink.add(links);
        }
        emit(
          AllGroupState(
            isLoading: false,
            listTitle: requests,
            listLink: listLink,
          ),
        );
      } catch (e) {
        emit(LoadFailure(error: e.toString(), isLoading: false));
      }
    });
  }
}
