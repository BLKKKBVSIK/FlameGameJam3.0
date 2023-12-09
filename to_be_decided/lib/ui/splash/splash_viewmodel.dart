import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import '../../misc/routes.dart';
import '../../services/navigation_service.dart';

@injectable
class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  SplashViewModel(this._navigationService);

  navigateToMenu() async {
    await _navigationService.navigateTo(Routes.menu);
  }
}
