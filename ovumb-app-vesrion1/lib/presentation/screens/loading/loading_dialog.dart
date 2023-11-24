import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_screen_controller.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class LoadingDialog {
  LoadingDialog._sharedInstance();
  static final LoadingDialog _shared = LoadingDialog._sharedInstance();
  factory LoadingDialog() => _shared;

  LoadingScreenController? _controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    } else {
      _controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingScreenController? showOverlay({
    required BuildContext context,
    required String text,
  }) {
    //add status text into StreamController
    final textController = StreamController<String>();
    textController.sink.add(text);
    final state = Overlay.of(context);
    print(text);

    //create overlay
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 200,
                maxHeight: 150,
                minWidth: 200,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const CircularProgressIndicator(
                      color: rose500,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: grey700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);

    return LoadingScreenController(close: () {
      textController.close();
      overlay.remove();
      return true;
    }, update: (text) {
      textController.add(text);
      return true;
    });
  }
}
