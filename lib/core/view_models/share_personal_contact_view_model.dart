import 'package:mobile_number/mobile_number.dart';
import 'package:scan_mo/core/models/user.dart';
import 'package:scan_mo/core/services/shared_prefs_service.dart';

import '../exports.dart';

class SharePersonalContactViewModel extends BaseViewModel {
  SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();
  int activeSimIndex = 0;
  List<SimCard> _cards = [];
  List<SimCard> get cards => _cards;
  String? displayName;
  String? currentSimData;

  String? user;

  void switchToSim({required int simIndex}) {
    if (activeSimIndex != simIndex) {
      activeSimIndex = simIndex;
      updateSimData();
      notifyListeners();
    }
    return;
  }

  initializeScreen() async {
    user = User(name: _sharedPrefsService.name!, phoneNumber: '09013240048')
        .toJson();
    displayName = _sharedPrefsService.name;
    setBusy(true);
    if (await MobileNumber.hasPhonePermission) {
      _cards = await MobileNumber.getSimCards!;
    } else {
      await MobileNumber.requestPhonePermission;
      _cards = await MobileNumber.getSimCards!;
    }
    updateSimData();
    setBusy(false);
  }

  void updateSimData() {
    currentSimData = "{'name': ${displayName}, 'phoneNumber: 09013240018}";
    print(cards[1].number);
    print(currentSimData);
    notifyListeners();
  }
}
