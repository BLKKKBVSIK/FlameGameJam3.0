import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:frostfire_flip/ui/game/models/frostfire_flip.dart';
import 'package:stacked/stacked.dart';
import '../../di/service_locator.dart';
import 'game_viewmodel.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameViewModel>.reactive(
      viewModelBuilder: () => sl<GameViewModel>(),
      builder: (context, viewModel, child) {
        final sizes = MediaQuery.of(context).size;
        myGameFactory() => FrostFireFlip(customHeight: sizes.height, customWidth: sizes.width);

        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/backgrounds/mat.jpg"), fit: BoxFit.cover),
                ),
              ),
              Center(
                child: GameWidget.controlled(
                  gameFactory: myGameFactory,
                  overlayBuilderMap: {
                    PlayState.welcome.name: (context, game) => InGameMenu(
                          menuContent: [
                            Text(
                              'TAP TO PLAY',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                    PlayState.gameOver.name: (context, game) => InGameMenu(menuContent: [
                          Text(
                            'G A M E   O V E R',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ]),
                    PlayState.won.name: (context, game) => InGameMenu(menuContent: [
                          Text(
                            'Y O U   W O N ! ! !',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            'PREPARE FOR THE NEXT LEVEL!',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ]),
                    PlayState.pause.name: (context, game) => InGameMenu(menuContent: [
                          Text(
                            'PAUSE MENU !',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.redAccent),
                          ),
                          const SizedBox(height: 50),
                          GestureDetector(
                            onTap: () {
                              viewModel.navigateToMenu();
                            },
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: sizes.width * 0.4),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(width: 2),
                                ),
                                child: const Text(
                                  "Go back to the menu",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ])
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class InGameMenu extends StatelessWidget {
  const InGameMenu({super.key, required this.menuContent});

  final List<Widget> menuContent;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(children: [SizedBox()]),
            ...menuContent,
          ],
        ),
      ),
    );
  }
}
