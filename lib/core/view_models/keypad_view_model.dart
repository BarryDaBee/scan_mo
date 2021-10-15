import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/call_log_view_model.dart';

class KeypadViewModel extends BaseViewModel {
  String phoneNumberInput = '';
  void updateNumberWith(String number) {
    phoneNumberInput += number;
    notifyListeners();
  }

  void makeCall() async {
    if (phoneNumberInput.isNotEmpty)
      await FlutterPhoneDirectCaller.callNumber(phoneNumberInput);
  }

  void setPhoneNumberTo(phoneNumber) {
    phoneNumberInput = phoneNumber;
    notifyListeners();
  }

  void clearAll() {
    phoneNumberInput = '';
    notifyListeners();
  }

  void popLastNumber() {
    phoneNumberInput =
        phoneNumberInput.substring(0, phoneNumberInput.length - 1);
    notifyListeners();
  }
}
