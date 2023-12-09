import 'package:flame/components.dart';

class MemoryCard extends SpriteComponent {
  late Sprite front;
  late Sprite back;
  bool isFlipped = false;

  MemoryCard(
      {required this.front,
      required this.back,
      required Vector2 position,
      required Vector2 size})
      : super(sprite: back, position: position, size: size);

  void flip() {
    isFlipped = !isFlipped;
    sprite = isFlipped ? front : back;
  }
}
