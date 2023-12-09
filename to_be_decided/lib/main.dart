import 'package:flutter/material.dart';
import 'package:to_be_decided/di/service_locator.dart';
import 'package:to_be_decided/misc/routes.dart';
import 'package:to_be_decided/misc/theme.dart';
import 'package:window_manager/window_manager.dart';
import 'services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await setupDependencyInjection();
  runApp(const MyGameApp());
}

class MyGameApp extends StatefulWidget {
  const MyGameApp({super.key});

  @override
  State<MyGameApp> createState() => _MyGameAppState();
}

class _MyGameAppState extends State<MyGameApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TBD',
      navigatorKey: sl<NavigationService>().navigatorKey,
      theme: GameTheme.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
