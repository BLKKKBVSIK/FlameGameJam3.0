import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../di/service_locator.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  final String? settings;

  const SplashView({super.key, this.settings});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

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
