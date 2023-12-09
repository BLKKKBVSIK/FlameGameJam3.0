import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../di/service_locator.dart';
import '../../widgets/back_button.dart';
import 'settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => sl<SettingsViewModel>(),
      builder: (context, viewModel, child) => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgrounds/menu_background.jpg"), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: size.height * 0.08),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text("Settings"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: viewModel.isFullScreen,
                          onChanged: (value) {
                            viewModel.toggleFullScreen(value);
                          }),
                      const SizedBox(width: 10),
                      const Text("Fullscreen"),
                    ],
                  ),
                  Row(
                    children: [
                      Slider(
                          min: 0,
                          max: 1,
                          divisions: 10,
                          label: "${(viewModel.volumeLevel * 100).round()}%",
                          value: viewModel.volumeLevel,
                          onChanged: (value) {
                            viewModel.setVolumeLevel(value);
                          }),
                      const SizedBox(width: 10),
                      const Text("Sound volume"),
                    ],
                  ),
                ]),
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
            )
          ],
        ),
      ),
    );
  }
}
