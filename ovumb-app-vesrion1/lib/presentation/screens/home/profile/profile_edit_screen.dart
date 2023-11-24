// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';
import 'package:flutter_ovumb_app_version1/data/validator/register_validator.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/profile/widgets/profile_edit_container_box.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

import '../../../../logic/bloc/main/main_bloc.dart';
import '../../../../logic/bloc/main/main_state.dart';

class ProfileEditScreen extends StatefulWidget {
  final NguoiDung nguoiDung;
  static const String routeName = 'profile-edit-screen';
  const ProfileEditScreen({
    Key? key,
    required this.nguoiDung,
  }) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  List<TextEditingController> _listController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    _listController[0].text = widget.nguoiDung.tenNguoiDung;
    _listController[1].text = widget.nguoiDung.canNang == null
        ? ''
        : widget.nguoiDung.canNang.toString();
    _listController[2].text = widget.nguoiDung.chieuCao == null
        ? ''
        : widget.nguoiDung.chieuCao.toString();
    super.initState();
  }

  @override
  void dispose() {
    _listController[0].dispose();
    _listController[1].dispose();
    _listController[2].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingLogo().show(context: context);
        } else {
          LoadingLogo().hide();
        }
        if (state is ProfileUpdateFailureState) {
          showErrorDialog(context, state.error.toString());
        } else if (state is ProfileUpdateSuccessState) {
          showToast(context, 'Cập nhật thông tin thành công');
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: TitleText(
              text: 'Chỉnh sửa',
              fontWeight: FontWeight.w600,
              size: 18,
              color: grey700,
            ),
            leading: IconButton(
              onPressed: () {
                context
                    .read<MainBloc>()
                    .add(ProfileEvent(id: widget.nguoiDung.maNguoiDung));
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/icons/back_button.png',
                scale: 3,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/right_home_icon.png',
                  scale: 3,
                  color: Colors.transparent,
                ),
              ),
            ],
            backgroundColor: whiteColor,
            shadowColor: whiteColor,
            bottomOpacity: 0.1,
            elevation: 3,
          ),
          body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/avatar.png',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: const SizedBox(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleText(
                                text: 'Họ và tên',
                                fontWeight: FontWeight.w500,
                                size: 16,
                                color: grey600,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ProfileEditContainerBox(
                                controller: _listController[0],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleText(
                                text: 'Cân nặng',
                                fontWeight: FontWeight.w500,
                                size: 16,
                                color: grey600,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ProfileEditContainerBox(
                                controller: _listController[1],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleText(
                                text: 'Chiều cao',
                                fontWeight: FontWeight.w500,
                                size: 16,
                                color: grey600,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ProfileEditContainerBox(
                                controller: _listController[2],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                rose600,
                                rose400,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(38),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.withOpacity(0.1),
                                spreadRadius: 4,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              )
                            ]),
                        child: ElevatedButton(
                          onPressed: () {
                            String? validate =
                                updateProfileValidator(_listController);
                            // validate == null là đã validate thành công
                            if (validate == null) {
                              context.read<MainBloc>().add(
                                    ProfileUpdateEvent(
                                      nguoiDung: NguoiDung(
                                        maNguoiDung:
                                            widget.nguoiDung.maNguoiDung,
                                        tenNguoiDung: _listController[0].text,
                                        namSinh: widget.nguoiDung.namSinh,
                                        canNang:
                                            int.parse(_listController[1].text),
                                        chieuCao:
                                            int.parse(_listController[2].text),
                                      ),
                                    ),
                                  );
                            } else {
                              showToast(context, validate);
                            }
                          },
                          style: ButtonStyle(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(0),
                            fixedSize: MaterialStateProperty.all(
                              Size(
                                size.width,
                                size.height * 0.065,
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                              PrimaryFont.semibold(16, FontWeight.w600)
                                  .copyWith(color: greyText),
                            ),
                          ),
                          child: Text(
                            'Lưu thông tin',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
