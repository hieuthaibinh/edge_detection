// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/group/group_item.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/constant/link.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/group_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/drawer/global_drawer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class GroupScreen extends StatelessWidget {
  final String maNguoiDung;
  static const routeName = 'group-screen';
  const GroupScreen({
    Key? key,
    required this.maNguoiDung,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return WillPopScope(
      onWillPop: () async {
        context.read<MainBloc>().add(HomeEvent(id: maNguoiDung));
        return true;
      },
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
              context.read<MainBloc>().add(HomeEvent(id: maNguoiDung));
            },
          ),
          centerTitle: true,
          title: TitleText(
            text: 'Cộng Đồng OvumB',
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
        body: Container(
          height: screenSize.height,
          width: screenSize.width,
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state is AllGroupState) {
                return ListView.builder(
                  itemCount: state.listLink.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 40),
                      height: state.listLink[index].length * 80 + 80,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: grey300.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 1),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TitleText(
                                  text: listTitleGroup[state.listTitle[index]],
                                  fontWeight: FontWeight.w600,
                                  size: 18,
                                  color: greyText,
                                ),
                              ),
                            ),
                            const Divider(
                              color: grey300,
                              height: 0,
                            ),
                            SizedBox(
                              height: state.listLink[index].length * 80,
                              child: ListView.builder(
                                itemCount: state.listLink[index].length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, i) {
                                  return GroupItem(
                                    image: state.listLink[index][i].image,
                                    title: state.listLink[index][i].title,
                                    member: state.listLink[index][i].member,
                                    subTitle:
                                        state.listLink[index][i].description,
                                    link: state.listLink[index][i].tenLink,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return getShimmer(GroupShimmer());
            },
          ),
        ),
      ),
    );
  }
}
