import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../di/service_locator.dart';
import '../../to_be_decided.dart';
import 'game_viewmodel.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameViewModel>.reactive(
      viewModelBuilder: () => sl<GameViewModel>(),
      builder: (context, viewModel, child) => GameWidget.controlled(
        gameFactory: ToBeDecided.new,
        overlayBuilderMap: {
          PlayState.welcome.name: (context, game) => Center(
                child: Text(
                  'TAP TO PLAY',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
          PlayState.gameOver.name: (context, game) => Center(
                child: Text(
                  'G A M E   O V E R',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
          PlayState.won.name: (context, game) => Center(
                child: Text(
                  'Y O U   W O N ! ! !',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
        },
      ),
    );
  }
}
