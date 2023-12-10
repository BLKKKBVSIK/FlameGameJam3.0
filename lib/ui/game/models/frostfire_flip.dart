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

  int difficulty = 0;

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

      print(cardPair.first.color == cardPair.last.color);

      if (cardPair.first.color == cardPair.last.color) {
        if (timerTurn.finished) {
          world.removeWhere((element) => cardPair.contains(element));

          timerTurn.reset();
          cards.clear();
        }
      } else {
        if (timerTurn.finished) {
          cardPair.forEach((element) {
            element.flip();
          });
          timerTurn.reset();
          cards.clear();
        }
      }
    }

    print("Cards: ${cards.length}");

    if (timerBeforeFlip.finished) {
      if (isTimerFinished == false) {
        isTimerFinished = true;
        world.children.whereType<enzo.MemoryCard>().forEach((card) => card.flip());
      }
    }

    if (world.children.whereType<enzo.MemoryCard>().isEmpty && isGameRunning) {
      playState = PlayState.won;
      difficulty++;
      isGameRunning = false;
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
      for (var i = 0; i < 6 + difficulty; i++)
        for (var j = 1; j <= 2 + difficulty; j++)
          enzo.MemoryCard(
            position: Vector2(
              (size.x - (100 * i)) - (i + 3) * 100 + i * (gameWidth * 0.015),
              (size.y - 150) - (j * 150 + j * ((gameWidth * 0.015) + 50)),
            ),
            color: i % 2 == 0 ? Colors.blue : Colors.red,
            imagePath: 'card_fire_1.png',
            onTap: () {},
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
