import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '/to_be_decided.dart';

void main() {
  final game = ToBeDecided();
  runApp(GameWidget(game: game));
}
