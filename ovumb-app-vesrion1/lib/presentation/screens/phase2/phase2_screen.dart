// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/nguoi_dung.dart';

import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/overall_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/phase2_initial_screen.dart';

class Phase2Screen extends StatefulWidget {
  static const routeName = 'phase2-screen';
  final NguoiDung nguoiDung;
  final int? phase;
  const Phase2Screen({
    Key? key,
    required this.nguoiDung,
    this.phase,
  }) : super(key: key);

  @override
  State<Phase2Screen> createState() => _Phase2ScreenState();
}

class _Phase2ScreenState extends State<Phase2Screen> {
  @override
  Widget build(BuildContext czontext) {
    context.read<MainBloc>().add(NgayDuSinhCheckEvent(id: widget.nguoiDung.maNguoiDung));
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        if (state is NgayDuSinhHasExistState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            OverallScreen.routeName,
            (route) => false,
            arguments: state.ngayDuSinh,
          );
        } else if (state is NgayDuSinhHasNotExistState) {
          Navigator.pushNamed(
            context,
            Phase2InitialScreen.routeName,
            arguments: {
              'maNguoiDung': widget.nguoiDung.maNguoiDung,
              'phase': widget.phase,
            },
          );
        }
      },
      child: const SizedBox(),
    );
  }
}