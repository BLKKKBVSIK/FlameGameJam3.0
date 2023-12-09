import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../di/service_locator.dart';
import 'menu_viewmodel.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => sl<MenuViewModel>(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backgrounds/menu_background.jpg"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    viewModel.navigateToGame();
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: sizes.width * 0.6),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(width: 2),
                      ),
                      child: const Text(
                        "Start game",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: sizes.width * 0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.navigateToSettings();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              border: Border.all(width: 2),
                            ),
                            child: const Text(
                              "Settings",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.navigateToCredits();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              border: Border.all(width: 2),
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 5),
                              ],
                            ),
                            child: const Text(
                              "Credits",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: sizes.width * 0.6),
                  child: GestureDetector(
                    onTap: () {
                      viewModel.closeGame();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        border: Border.all(width: 2),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 5),
                        ],
                      ),
                      child: const Text(
                        "Close",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
