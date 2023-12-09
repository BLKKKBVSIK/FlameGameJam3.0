import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import '../../services/flame_audio_service.dart';
import '../../services/navigation_service.dart';
import '../../services/window_manager_service.dart';

@injectable
class SettingsViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final WindowManagerService _windowManagerService;
  final FlameAudioService _flameAudioService;

  SettingsViewModel(
    this._navigationService,
    this._windowManagerService,
    this._flameAudioService,
  );

  bool isFullScreen = false;
  double volumeLevel = 0.5;

  void goBack() {
    _navigationService.goBack();
  }

  void toggleFullScreen(bool? value) {
    if (kIsWeb) {
      _navigationService.showSnackBar('Not supported on web');
      return;
    }

    isFullScreen = value ?? false;
    _windowManagerService.setFullScreen(isFullScreen);
    notifyListeners();
  }

  void setVolumeLevel(double value) {
    volumeLevel = value;
    _flameAudioService.setVolume(volumeLevel);
    notifyListeners();
  }
}
