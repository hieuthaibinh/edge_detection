import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_screen_controller.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class LoadingLogo {
  factory LoadingLogo() => _shared;
  static final LoadingLogo _shared = LoadingLogo._sharedInstance();
  LoadingLogo._sharedInstance();

  LoadingScreenController? controller;

  void show({
    required BuildContext context,
  }) {
    controller = showOverlay(
      context: context,
    );
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverlay({
    required BuildContext context,
  }) {
    final state = Overlay.of(context);

    final overlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withAlpha(150),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: const CircularProgressIndicator(
                  //value: 50,
                  backgroundColor: Colors.transparent,
                  color: rose500,
                  strokeWidth: 10,
                ),
              ),
              // Container(
              //   child: Image.asset('assets/logo/logo.png'),
              // ),
              CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/logo/logo.png'),
              ),
            ],
          ),
        ),
      );
    });

    state.insert(overlay);

    return LoadingScreenController(close: () {
      overlay.remove();
      return true;
    }, update: (text) {
      return true;
    });
  }
}
