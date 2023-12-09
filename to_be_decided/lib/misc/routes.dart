import 'package:flutter/material.dart';
import 'package:to_be_decided/widgets/game_app.dart';
import '../ui/menu/menu_view.dart';
import '../ui/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.game:
        return MaterialPageRouteNoAnim(builder: (context) => const GameApp());
      case Routes.menu:
        return MaterialPageRouteNoAnim(builder: (context) => const MenuView());
      case Routes.splash:
        return MaterialPageRoute(
            settings: settings, builder: (context) => SplashView(settings: settings.name));
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
}
