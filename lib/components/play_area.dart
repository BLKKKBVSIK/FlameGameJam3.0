import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../ui/game/models/frostfire_flip.dart';

class PlayArea extends RectangleComponent with HasGameReference<FrostFireFlip> {
  PlayArea()
      : super(
          paint: Paint()..color = Colors.black,
          children: [RectangleHitbox()],
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    size = Vector2(game.width, game.height);
    size = Vector2(game.width, game.height);

    // Load the sprites for the card
    /* Sprite front = await game.loadSprite('assets/images/front.png');
    Sprite back = await game.loadSprite('assets/images/back.png'); */

    // Create a MemoryCard instance
    /* MemoryCard memoryCard =
        MemoryCard(front: front, back: back, position: Vector2.all(100), size: Vector2.all(50));

    add(memoryCard); */
  }
}
