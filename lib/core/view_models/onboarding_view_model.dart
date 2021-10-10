import '../exports.dart';

class OnboardingViewModel extends BaseViewModel {
  int pageIndex = 0;
  void changePage(index) {
    pageIndex = index;

    notifyListeners();
  }
}
