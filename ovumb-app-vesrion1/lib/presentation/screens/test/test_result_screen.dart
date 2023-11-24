// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_result_failure_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_result_success_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/test/test_result_thai_screen.dart';

// màn hình hiện kết quả sau khi test
class TestResultScreen extends StatefulWidget {
  static const routeName = 'test-result-screen';
  //final File file;
  final int maQuanLyQueTest;
  final int maLoaiQue;
  final double lh;
  final bool isError;

  const TestResultScreen({
    Key? key,
    required this.maQuanLyQueTest,
    required this.maLoaiQue,
    required this.lh,
    required this.isError,
  }) : super(key: key);

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestBloc, TestState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingDialog().show(context: context, text: 'Đang phân tích...');
        } else {
          LoadingDialog().hide();
        }
      },
      builder: (context, state) {
        if (state is TestStateResultSuccess) {
          return TestResultSuccessScreen(
            testResult: state.result,
            maKetQuaTest: state.maKetQuaTest,
            lh: state.lh,
            tbnkn: state.tbnknNew,
            position: state.position,
          );
        } else if (state is TestStateResultThaiSuccess) {
          return TestResultThaiScreen(testResult: state.result);
        } else if (state is TestResultStateFailure) {
          return TestResultFailureScreen(
            testResult: state.result,
            maLoaiQue: widget.maLoaiQue,
            maQuanLyQueTest: widget.maQuanLyQueTest,
          );
        }
        return const SizedBox();
      },
    );
  }
}
