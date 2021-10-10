import 'package:scan_mo/core/services/shared_prefs_service.dart';
import '../exports.dart';

class OnboardingViewModel extends BaseViewModel {
  int pageIndex = 0;
  void changePage(index) {
    pageIndex = index;

    notifyListeners();
  }
}
