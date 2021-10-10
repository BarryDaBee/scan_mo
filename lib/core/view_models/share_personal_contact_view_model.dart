import 'package:scan_mo/core/models/user.dart';
import 'package:scan_mo/core/services/shared_prefs_service.dart';

import '../exports.dart';

class SharePersonalContactViewModel extends BaseViewModel {
  SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();
  int activePhoneIndex = 0;

  String? displayName;
  String? currentSimData;

  String? userPrimary;
  String? userSecondary;

  void switchToSim({required int simIndex}) {
    if (activePhoneIndex != simIndex) {
      activePhoneIndex = simIndex;
      notifyListeners();
    }
    return;
  }

  initializeScreen() async {
    userPrimary = User(
      name: _sharedPrefsService.name!,
      phoneNumbers: [
        _sharedPrefsService.primaryPhone!,
        // _sharedPrefsService.secondaryPhone!
      ],
    ).toJson();
    userSecondary = User(
      name: _sharedPrefsService.name!,
      phoneNumbers: [
        // _sharedPrefsService.primaryPhone!,
        _sharedPrefsService.secondaryPhone!
      ],
    ).toJson();

    displayName = _sharedPrefsService.name;
  }
}
