import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/services.dart';

class MemoryCard extends PositionComponent with TapCallbacks {
  final String imagePath;
  final Function onTap;
  final Color color;

  MemoryCard({
    required Vector2 position,
    required this.imagePath,
    required this.onTap,
    required this.color,
  }) : super(
          size: Vector2(100, 150),
          anchor: Anchor.center,
          position: position,
        );

  @override
  void onTapDown(_) {
    print("tapped down");
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


/* 

class MemoryCardDisplay extends StatefulWidget {
  const MemoryCardDisplay({super.key});

  @override
  State<MemoryCardDisplay> createState() => _MemoryCardDisplayState();
}

class _MemoryCardDisplayState extends State<MemoryCardDisplay> {
  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isFlipped) {
          onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isFlipped ? Colors.white : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isFlipped
            ? Image.asset(
                imagePath,
                fit: BoxFit.cover,
              )
            : Container(),
      ),
    );
  }
}
 */