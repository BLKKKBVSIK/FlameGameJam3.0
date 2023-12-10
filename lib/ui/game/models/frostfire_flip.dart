import 'dart:async';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frostfire_flip/components/components.dart';
import '../../../di/service_locator.dart';
import '../../../services/flame_audio_service.dart';
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

  int difficulty = 1;

  bool isGameRunning = false;

  List<enzo.MemoryCard> get cards =>
      world.children.whereType<enzo.MemoryCard>().where((element) => element.isFlipped).toList();

  final timerBeforeFlip = Timer(
    3,
  );
  final timerTurn = Timer(
    1,
  );

  bool isTimerFinished = false;

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
  void update(double dt) {
    super.update(dt);

    !timerBeforeFlip.isRunning() ? timerBeforeFlip.start() : timerBeforeFlip.update(dt);

    if (cards.length == 2) {
      !timerTurn.isRunning() ? timerTurn.start() : timerTurn.update(dt);
      final cardPair =
          world.children.whereType<enzo.MemoryCard>().where((element) => element.isFlipped);

      if (cardPair.first.color == cardPair.last.color) {
        if (timerTurn.finished) {
          world.removeWhere((element) => cardPair.contains(element));
          timerTurn.reset();
          sl<FlameAudioService>().playEffect('level_complete.mp3');
          cards.clear();
        }
      } else {
        if (timerTurn.finished) {
          for (var element in cardPair) {
            element.flip();
          }
          timerTurn.reset();
          cards.clear();
          playState = PlayState.gameOver;
          world.removeWhere((component) => component is enzo.MemoryCard);
          difficulty = 0;
          isGameRunning = false;
        }
      }
    }

    /* if (timerBeforeFlip.finished) {
      if (isTimerFinished == false) {
        isTimerFinished = true;
        world.children.whereType<enzo.MemoryCard>().forEach((card) => card.flip());
        sl<FlameAudioService>().playEffect('card_flip.mp3');
      }
    } */

    if (world.children.whereType<enzo.MemoryCard>().isEmpty && isGameRunning) {
      playState = PlayState.won;
      sl<FlameAudioService>().playEffect('clap_sound.mp3');
      difficulty++;
      isGameRunning = false;
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.center;
    world.add(PlayArea());
    playState = PlayState.welcome;
  }

  void startGame() {
    if (playState == PlayState.playing) return;

    playState = PlayState.playing;

    final posMinX = ((((2 + difficulty) * 100) + ((2 + difficulty * 10)))) / 2;
    final posMinY = (((2 + difficulty) * 150) + ((2 + difficulty * 10))) / 2;

    world.addAll([
      for (var i = 0; i < 2 + difficulty; i++)
        for (var j = 0; j < 2; j++)

          // TODO(Nikuu): Center the cards here :(

          // Place all the cards in the center of the screen
          enzo.MemoryCard(
            position: Vector2(
              -posMinX + ((i * 100) + (i * 10)),
              ((j * 150) + (j * 10)),
            ),
            color: Colors.red, // colors.elementAt(i),
          ),
    ]);
    isTimerFinished = false;
    isGameRunning = true;
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
        } else {
          playState = PlayState.playing;
          resumeEngine();
          return KeyEventResult.handled;
        }
    }
    return KeyEventResult.handled;
  }

  @override
  Color backgroundColor() => Colors.transparent;
}
