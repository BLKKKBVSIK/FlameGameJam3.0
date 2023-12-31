import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../ui/credits/credits_view.dart';
import '../ui/game/game_view.dart';
import '../ui/menu/menu_view.dart';
import '../ui/settings/settings_view.dart';
import '../ui/splash/splash_view.dart';
import '../ui/web_music/web_music_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.settings:
        return MaterialPageRouteNoAnim(builder: (context) => const SettingsView());
      case Routes.credits:
        return MaterialPageRouteNoAnim(builder: (context) => const CreditsView());
      case Routes.game:
        return MaterialPageRouteNoAnim(builder: (context) => const GameView());
      case Routes.menu:
        return MaterialPageRouteNoAnim(builder: (context) => const MenuView());
      case Routes.splash:
        return MaterialPageRouteNoAnim(
            builder: (context) => kIsWeb ? const WebMusicView() : const SplashView());
      //return MaterialPageRouteNoAnim(builder: (context) => const GameView());
      /*  return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(),
        ); */
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return const Scaffold(
          body: Column(children: [
            Center(
              child: Text('Page not found !'),
              // Center
            ),
          ]),
        );
      },
    );
  }
}

class MaterialPageRouteNoAnim extends MaterialPageRoute {
  MaterialPageRouteNoAnim({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class Routes {
  static const String splash = '/';
  static const String menu = '/menu';
  static const String game = '/game';
  static const String credits = '/credits';
  static const String settings = '/settings';
}
