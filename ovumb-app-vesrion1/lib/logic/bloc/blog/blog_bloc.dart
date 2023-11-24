import 'package:flutter_ovumb_app_version1/data/models/blog/blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/type_blog.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/server/server_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogStateInitial(isLoading: false)) {
    final ServerRepository _serverRepository = ServerRepository();
    // sự kiện ấn vào nút home

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
  }
}
