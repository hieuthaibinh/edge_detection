import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_screen_controller.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class LoadingStore {
  factory LoadingStore() => _shared;
  static final LoadingStore _shared = LoadingStore._sharedInstance();
  LoadingStore._sharedInstance();

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
        color: Colors.transparent,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: const CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: whiteColor,
              ),
            ),
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
