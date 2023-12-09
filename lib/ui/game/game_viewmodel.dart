import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import '../../services/navigation_service.dart';

@injectable
class GameViewModel extends BaseViewModel {
  NavigationService _navigationService;

  GameViewModel(this._navigationService);
}
