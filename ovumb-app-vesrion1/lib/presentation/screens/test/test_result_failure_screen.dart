// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/test_resutl.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_event.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:permission_handler/permission_handler.dart';

class TestResultFailureScreen extends StatefulWidget {
  final TestResult testResult;
  final int maLoaiQue;
  final int maQuanLyQueTest;
  const TestResultFailureScreen({
    Key? key,
    required this.testResult,
    required this.maLoaiQue,
    required this.maQuanLyQueTest,
  }) : super(key: key);

  @override
  State<TestResultFailureScreen> createState() =>
      _TestResultFailureScreenState();
}

class _TestResultFailureScreenState extends State<TestResultFailureScreen> {
  int index = 0;
  String? _imagePath;
  int? lh;

  //Mở cameca và chụp để lấy image path
  Future<void> getImage(BuildContext context) async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }
    if (!isCameraGranted) {
      // Have not permission to camera
      return;
    }

    // Generate filepath for saving
    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    try {
      //Make sure to await the call to detectEdge.
      await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Quét que Test',
        androidCropTitle: 'Quét que Test',
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      _imagePath = imagePath;
      File image = File(_imagePath!);
      img.Image colorImage = img.decodeImage(image.readAsBytesSync())!;

      // Chuyển đổi ảnh màu sang đen trắng
      img.Image blackAndWhiteImage = img.grayscale(colorImage);
      checkLH(context, blackAndWhiteImage);
    } catch (e) {
      print('lỗi $e');
    }
  }

  void checkLH(
    BuildContext context,
    img.Image image,
  ) {
    context.read<TestBloc>().add(
          TestSubmitLHEvent(
            image: image,
            maQuanLyQueTest: widget.maQuanLyQueTest,
            maLoaiQue: widget.maLoaiQue,
          ),
        );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(int.parse(widget.testResult.backgroundColor)),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 7,
                child: Image.asset(
                  widget.testResult.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      TitleText(
                        text: widget.testResult.titleText,
                        fontWeight: FontWeight.w700,
                        size: 24,
                        color: Color(int.parse(widget.testResult.textColor)),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.testResult.subText[0],
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ).copyWith(
                          color: grey600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(int.parse(widget.testResult.backgroundColor)),
                            Color(int.parse(widget.testResult.backgroundColor)),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(38),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.05),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: ElevatedButton(
                      onPressed: () async {
                        await getImage(context);
                      },
                      style: ButtonStyle(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(38),
                              side: BorderSide(
                                color: rose400,
                              )),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        fixedSize: MaterialStateProperty.all(
                          Size(
                            screenSize.width,
                            screenSize.height * 0.065,
                          ),
                        ),
                        //foregroundColor: MaterialStateProperty.all(roseTitleText),
                        textStyle: MaterialStateProperty.all(
                          PrimaryFont.semibold(16, FontWeight.w600)
                              .copyWith(color: greyText),
                        ),
                      ),
                      child: Text(
                        'Thử lại',
                        style: TextStyle(
                          color: rose500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
