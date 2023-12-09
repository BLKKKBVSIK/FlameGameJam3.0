import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../di/service_locator.dart';
import 'menu_viewmodel.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final _sizes = MediaQuery.of(context).size;

    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => sl<MenuViewModel>(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white60,
        body: Center(
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
                  constraints: BoxConstraints(maxWidth: _sizes.width * 0.6),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: const Text(
                      "Play",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: _sizes.width * 0.6),
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
                          decoration: BoxDecoration(border: Border.all(width: 2)),
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
                          viewModel.closeGame();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(border: Border.all(width: 2)),
                          child: const Text(
                            "Close",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
