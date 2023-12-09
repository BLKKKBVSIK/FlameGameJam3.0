import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:to_be_decided/di/service_locator.dart';
import 'package:to_be_decided/ui/credits/credits_viewmodel.dart';

import '../../widgets/back_button.dart';
import '_widgets/madeBy.dart';

class CreditsView extends StatelessWidget {
  const CreditsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder<CreditsViewModel>.reactive(
      viewModelBuilder: () => sl<CreditsViewModel>(),
      builder: (context, viewModel, child) => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgrounds/menu_background.jpg"), fit: BoxFit.cover),
              ),
              child: RawScrollbar(
                thumbColor: Colors.redAccent,
                radius: const Radius.circular(20),
                thumbVisibility: true,
                timeToFade: const Duration(days: 1),
                interactive: true,
                thickness: 20,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.1),
                      const Text(
                        "Made with ❤️ by",
                        style: TextStyle(fontSize: 48, fontFamily: "LavaLava", color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MadeByWidget(
                            assetPath: 'assets/credits/ghAvatarNikuu.jpeg',
                            radius: size.width * 0.1,
                            isColdTheme: false,
                            label: "Nikuu",
                          ),
                          MadeByWidget(
                            assetPath: 'assets/credits/ghAvatarEnzo.png',
                            radius: size.width * 0.1,
                            isColdTheme: true,
                            label: "Enzo",
                          )
                        ],
                      ),
                      FlutterLogo(
                        size: size.height * 0.2,
                      ),
                      const LogoCredits(logoPath: 'assets/credits/flame_logo.png'),
                      const LogoCredits(logoPath: 'assets/credits/firefly_logo.png'),
                      SizedBox(height: size.height * 0.1),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.05,
              child: GenericBackButton(
                action: () {
                  viewModel.goBack();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoCredits extends StatelessWidget {
  const LogoCredits({super.key, required this.logoPath});

  final String logoPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Image.asset(
      logoPath,
      width: size.width * 0.4,
      height: size.height * 0.2,
    );
  }
}
