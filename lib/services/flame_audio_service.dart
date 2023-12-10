import 'package:flame_audio/flame_audio.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class FlameAudioService with ListenableServiceMixin {
  final ReactiveValue<double> _volume = ReactiveValue<double>(1);
  double get volume => _volume.value;

  // init method
  Future<void> init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.bgm.play('long_rest.mp3', volume: _volume.value);
  }

  // set volume method
  void setVolume(double volume) {
    _volume.value = volume;
    FlameAudio.bgm.audioPlayer.setVolume(volume);
    notifyListeners();
  }

  // play method
  Future<void> play(String audioPath) async {
    FlameAudio.bgm.play(audioPath, volume: _volume.value);
  }

  Future<void> playEffect(String audioPath) async {
    FlameAudio.play(audioPath, volume: _volume.value);
  }
}
