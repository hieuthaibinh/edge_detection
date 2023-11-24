import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_screen_controller.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class LoadingScreen {
  factory LoadingScreen() => _shared;
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  LoadingScreen._sharedInstance();

  LoadingScreenController? controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final _text = StreamController<String>();
    _text.add(text);

    final state = Overlay.of(context);

    final overlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withAlpha(150),
        child: Center(
          child: const CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            color: rose500,
          ),
        ),
      );
    });

    state.insert(overlay);

    return LoadingScreenController(close: () {
      _text.close();
      overlay.remove();
      return true;
    }, update: (text) {
      _text.add(text);
      return true;
    });
  }
}
