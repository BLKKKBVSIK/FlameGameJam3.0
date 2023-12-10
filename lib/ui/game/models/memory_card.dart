import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as UI;

import 'package:flutter/services.dart';
import 'package:frostfire_flip/services/flame_audio_service.dart';

import '../../../di/service_locator.dart';

class MemoryCard extends PositionComponent with TapCallbacks {
  final Color color;

  MemoryCard({
    required Vector2 position,
    required this.color,
  }) : super(
          size: Vector2(100, 150),
          anchor: Anchor.center,
          position: position,
        );

  @override
  void onTapDown(_) {
    sl<FlameAudioService>().playEffect('card_flip.mp3');
    flip();
  }

  bool isFlipped = true;

  bool get isFaceUp => isFlipped;
  void flip() => isFlipped = !isFlipped;

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    flip();
  }

  @override
  void render(Canvas canvas) {
    if (isFaceUp) {
      _renderFront(canvas);
    } else {
      _renderBack(canvas);
    }
  }

  static final Paint backBackgroundPaint = Paint()..color = const Color(0xff380c02);
  static final Paint backBorderPaint1 = Paint()
    ..color = const Color(0xffdbaf58)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;
  static final Paint backBorderPaint2 = Paint()
    ..color = const Color(0x5CEF971B)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 35;
  static final RRect cardRRect = RRect.fromRectAndRadius(
    Vector2(100, 150).toRect(),
    const Radius.circular(5),
  );
  static final RRect backRRectInner = cardRRect.deflate(40);

  void _renderBack(Canvas canvas) {
    canvas.drawRRect(cardRRect, backBackgroundPaint);
    canvas.drawRRect(cardRRect, backBorderPaint1);
    canvas.drawRRect(backRRectInner, backBorderPaint2);
  }

  void _renderFront(Canvas canvas) {
    canvas.drawRRect(cardRRect, Paint()..color = color);
  }

  Future<UI.Image> loadUiImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final Completer<UI.Image> completer = Completer();
    UI.decodeImageFromList(Uint8List.view(data.buffer), (UI.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}
