import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:to_be_decided/services/navigation_service.dart';
import 'package:window_manager/window_manager.dart';

import '../../misc/routes.dart';

@injectable
class MenuViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  MenuViewModel(this._navigationService);

  void navigateToGame() {
    // Navigate to the actual game
    _navigationService.navigateTo(Routes.game);
  }

  void closeGame() async {
    // Close the game. TYVM for playing
    // Nikuu & Enzo!
    await windowManager.close();
  }

  void navigateToSettings() {}
}
