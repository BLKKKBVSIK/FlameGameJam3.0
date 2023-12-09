import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../di/service_locator.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => sl<SplashViewModel>(),
      builder: (context, viewModel, child) => FlameSplashScreen(
        theme: FlameSplashTheme.dark,
        onFinish: (BuildContext context) async => await viewModel.navigateToMenu(),
      ),
    );
  }
}
