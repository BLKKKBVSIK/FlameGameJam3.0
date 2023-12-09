import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:to_be_decided/services/navigation_service.dart';

@injectable
class CreditsViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  CreditsViewModel(this._navigationService);

  bool isBackButtonHovered = false;

  goBack() {
    _navigationService.goBack();
  }

  void setBackButtonHover(bool bool) {
    isBackButtonHovered = bool;
    notifyListeners();
  }
}
