import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class MemoryCard extends StatelessWidget {
  final bool isFlipped;
  final String imagePath;
  final Function onTap;

  MemoryCard({
    required this.isFlipped,
    required this.imagePath,
    required this.onTap,
  });

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
