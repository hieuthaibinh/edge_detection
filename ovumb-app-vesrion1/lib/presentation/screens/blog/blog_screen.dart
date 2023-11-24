// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_category.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class BlogScreen extends StatefulWidget {
  final int phase;
  static const routeName = 'blog-screen';
  const BlogScreen({
    Key? key,
    required this.phase,
  }) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  bool isLoaded = false;
  List<String> title = [
    'Quan Hệ An Toàn',
    'Kiến Thức Sinh Sản',
    'Kiến Thức Tuổi Dậy Thì'
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: GlobalDrawer(
          size: screenSize,
          scaffoldKey: scaffoldKey,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            color: Color(0xfffd6f8e),
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: TitleText(
            text: title[widget.phase - 1],
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
          actions: [
            IconButton(
              onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              icon: Image.asset(
                'assets/icons/right_home_icon.png',
                scale: 3,
              ),
            ),
          ],
        ),
        body: BlocBuilder<BlogBloc, BlogState>(
          builder: (context, state) {
            if (state is HasNoBlogState) {
              return Center(
                child: TitleText(
                  text: 'Hiện tại chưa có bài viết nào',
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: greyText,
                ),
              );
            } else if (state is AllBlogState) {
              return ListView.builder(
                itemCount: state.listBlogs.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BlogCategory(
                    type: state.listType[index].type,
                    blogs: state.listBlogs[index].reversed.toList(),
                  );
                },
              );
            } else if (state is Phase5BlogState) {
              return ListView.builder(
                itemCount: state.listBlogs.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BlogCategory(
                    type: state.listType[index].type,
                    blogs: state.listBlogs[index].reversed.toList(),
                  );
                },
              );
            } else {
              return getShimmer(
                BlogShimmer(),
              );
            }
          },
        ),
      ),
    );
  }
}
