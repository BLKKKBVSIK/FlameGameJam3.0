import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../ui/game/models/frostfire_flip.dart';

class PlayArea extends RectangleComponent with HasGameReference<FrostFireFlip> {
  PlayArea()
      : super(
          paint: Paint()..color = Colors.transparent,
          children: [RectangleHitbox()],
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    size = Vector2(game.width, game.height);
    size = Vector2(game.width, game.height);
  }
}
