import 'package:flutter/material.dart';
import 'package:frostfire_flip/services/flame_audio_service.dart';

import '../../di/service_locator.dart';
import '../../misc/routes.dart';
import '../../services/navigation_service.dart';

class WebMusicView extends StatelessWidget {
  const WebMusicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Because you are on web, you need to interact with the document first to enable audio.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () async {
              await sl<FlameAudioService>().init();
              await sl<NavigationService>().navigateTo(Routes.menu);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.red,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Activate audio and play the game",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
