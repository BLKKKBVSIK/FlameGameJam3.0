import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class NavigationService with ListenableServiceMixin {
  NavigationService() {
    listenToReactiveValues([]);
  }
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigate to route
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  // Navigate to route and remove all previous routes
  Future<dynamic> navigateToAndReplace(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  // Navigate to route and remove all previous routes
  Future<dynamic> navigateToAndReplaceWithoutAnimation(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  // Navigate with arguments
  Future<dynamic> navigateToWithArgs(String routeName, Object arguments) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  // Navigate with arguments
  Future<dynamic> navigateToWithArgsAndReplace(
    String routeName,
    Object arguments,
  ) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  // Go to previous route
  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  void goBackUntil(String routeName) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  // Go to previous route with arguments
  void goBackWithArgs(Object arguments) {
    return navigatorKey.currentState!.pop(arguments);
  }

  Future<dynamic> navigateToWithAnimation(
    Widget pushedView,
  ) async {
    final res = await navigatorKey.currentState!.push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pushedView,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
    return res;
  }

  void showSnackBar(String message, {Color? color}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color ?? Colors.red,
        ),
      ),
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }
}
