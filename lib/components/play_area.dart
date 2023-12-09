import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../to_be_decided.dart';
import 'memory_card.dart';

class PlayArea extends RectangleComponent with HasGameReference<ToBeDecided> {
  PlayArea()
      : super(
          paint: Paint()..color = const Color(0xfff2e8cf),
          children: [RectangleHitbox()],
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);

    // Load the sprites for the card
    Sprite front = await game.loadSprite('assets/images/front.png');
    Sprite back = await game.loadSprite('assets/images/back.png');

    // Create a MemoryCard instance
    MemoryCard memoryCard = MemoryCard(
        front: front,
        back: back,
        position: Vector2.all(100),
        size: Vector2.all(50));

    add(memoryCard);
  }
}
