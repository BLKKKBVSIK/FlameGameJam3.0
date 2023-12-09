import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import '../../misc/routes.dart';
import '../../services/navigation_service.dart';
import '../../services/window_manager_service.dart';

@injectable
class MenuViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final WindowManagerService _windowManagerService;

  MenuViewModel(this._navigationService, this._windowManagerService);

  void navigateToGame() {
    // Navigate to the actual game
    _navigationService.navigateTo(Routes.game);
  }

  void closeGame() async {
    // Close the game. TYVM for playing
    // Nikuu & Enzo!
    await _windowManagerService.closeWindows();
  }

  void navigateToSettings() {
    // Navigate to the settings menu
    _navigationService.navigateTo(Routes.settings);
  }

  void navigateToCredits() {
    // Navigate to the credits menu
    _navigationService.navigateTo(Routes.credits);
  }
}
