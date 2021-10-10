import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/services/shared_prefs_service.dart';

class SignUpViewModel extends BaseViewModel {
  SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();

  void setUserName(name) {
    _sharedPrefsService.name = name;
  }

  void setPrimaryPhone(String phone) {
    _sharedPrefsService.primaryPhone = phone;
  }

  void setSecondaryPhone(String phone) {
    _sharedPrefsService.secondaryPhone = phone;
  }

  void markAsOldUser() {
    _sharedPrefsService.markAsOldUser();
  }
}
