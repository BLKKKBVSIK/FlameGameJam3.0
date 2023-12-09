import 'dart:async';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frostfire_flip/components/components.dart';
import 'package:frostfire_flip/config.dart';

import 'memory_card.dart' as enzo;

enum PlayState { welcome, playing, gameOver, won, pause }

class FrostFireFlip extends FlameGame with KeyboardEvents, TapDetector {
  FrostFireFlip({required double customHeight, required double customWidth})
      : super(
          camera: CameraComponent.withFixedResolution(
            width: customWidth,
            height: customHeight,
          ),
        );

  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;

  late PlayState _playState;
  PlayState get playState => _playState;
  set playState(PlayState playState) {
    _playState = playState;
    switch (playState) {
      case PlayState.welcome:
      case PlayState.pause:
        overlays.add(playState.name);
      case PlayState.gameOver:
      case PlayState.won:
        overlays.add(playState.name);
      case PlayState.playing:
        overlays.remove(PlayState.welcome.name);
        overlays.remove(PlayState.gameOver.name);
        overlays.remove(PlayState.won.name);
        overlays.remove(PlayState.pause.name);
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());
    playState = PlayState.welcome;
  }

  void startGame() {
    if (playState == PlayState.playing) return;

    playState = PlayState.playing;

    world.addAll([
      for (var i = 0; i < 6; i++)
        for (var j = 1; j <= 2; j++)
          enzo.MemoryCard(
              position: Vector2(
                (i + 1) * 100 + (i + 2) * brickGutter,
                (j + 2.0) * 150 + j * brickGutter,
              ),
              color: Colors.green,
              imagePath: 'card_fire_1.png',
              onTap: () {
                print("eeewww");
              }),
    ]);
  }

  @override
  void onTap() {
    super.onTap();
    startGame();
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);
    switch (event.logicalKey) {
      case LogicalKeyboardKey.space:
      case LogicalKeyboardKey.enter:
        startGame();
      case LogicalKeyboardKey.escape:
        if (playState == PlayState.playing) {
          playState = PlayState.pause;
          pauseEngine();
          return KeyEventResult.handled;
        } else if (playState == PlayState.pause) {
          playState = PlayState.playing;
          resumeEngine();
          return KeyEventResult.handled;
        }
    }
    return KeyEventResult.handled;
  }

  @override
  Color backgroundColor() => const Color(0xfff2e8cf);
}
