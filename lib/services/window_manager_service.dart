import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:window_manager/window_manager.dart';

@lazySingleton
class WindowManagerService with ListenableServiceMixin {
  final ReactiveValue<double> _volume = ReactiveValue<double>(1);
  double get volume => _volume.value;

  // init method
  Future<void> init() async {
    await windowManager.ensureInitialized();
    await windowManager.setMinimumSize(const Size(800, 600));
  }

  // Set fullscreen
  void setFullScreen(bool isFullScreen) {
    windowManager.setFullScreen(isFullScreen);
  }

  Future closeWindows() async {
    await windowManager.close();
  }
}
