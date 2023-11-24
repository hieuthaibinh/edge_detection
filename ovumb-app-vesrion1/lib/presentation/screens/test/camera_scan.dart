// import 'package:camera/camera.dart';
// import 'package:edge_detection/edge_detection.dart';
// import 'package:flutter/material.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// //đây là màn hình chụp ảnh và lưu ảnh
// class CameraScan extends StatefulWidget {
//   static const routeName = 'camera-scan';
//   const CameraScan({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CameraScan> createState() => _CameraScanState();
// }

// class _CameraScanState extends State<CameraScan> {
//   String? _imagePath;
//   late CameraController controller;

//   @override
//   void initState() {
//     super.initState();
//     getImage();
//   }

//   //get image
//   Future<void> getImage() async {
//     bool isCameraGranted = await Permission.camera.request().isGranted;
//     if (!isCameraGranted) {
//       isCameraGranted =
//           await Permission.camera.request() == PermissionStatus.granted;
//     }
//     if (!isCameraGranted) {
//       // Have not permission to camera
//       return;
//     }

//     // Generate filepath for saving
//     String imagePath = join((await getApplicationSupportDirectory()).path,
//         "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

//     try {
//       //Make sure to await the call to detectEdge.
//       await EdgeDetection.detectEdge(
//         imagePath,
//         canUseGallery: true,
//         androidScanTitle:
//             'Quét que Test', // use custom localizations for android
//         androidCropTitle: 'Cắt',
//         androidCropBlackWhiteTitle: 'Black White',
//         androidCropReset: 'Reset',
//       );
//     } catch (e) {
//       print(e);
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _imagePath = imagePath;
//     });
//   }

//   //save image
//   Future<void> saveImage() async {
//     await GallerySaver.saveImage(_imagePath!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     //_imagePath != null ? saveImage() : null;
//     // return Visibility(
//     //   visible: _imagePath != null,
//     //   child: Padding(
//     //     padding: const EdgeInsets.all(8.0),
//     //     child: Image.file(
//     //       File(_imagePath ?? ''),
//     //     ),
//     //   ),
//     // );
//     return MediaQuery( data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
//       child: const SizedBox(),
//     );
//   }
// }
