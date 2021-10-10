import 'package:mobile_number/mobile_number.dart';
import 'package:scan_mo/core/models/user.dart';
import 'package:scan_mo/core/services/shared_prefs_service.dart';

import '../exports.dart';

class SharePersonalContactViewModel extends BaseViewModel {
  SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();
  int activePhoneIndex = 0;
  List<SimCard> _cards = [];

  List<SimCard> get cards => _cards;
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
    setBusy(true);
    if (await MobileNumber.hasPhonePermission) {
      _cards = await MobileNumber.getSimCards!;
    } else {
      await MobileNumber.requestPhonePermission;
      _cards = await MobileNumber.getSimCards!;
    }

    setBusy(false);
  }
}
