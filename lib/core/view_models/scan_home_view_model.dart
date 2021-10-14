import 'dart:convert';
import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/services/shared_prefs_service.dart';

class ScanHomeViewModel extends BaseViewModel {
  SharedPrefsService sharedPrefs = locator<SharedPrefsService>();

  String get userName => sharedPrefs.name ?? 'User';

  scanAndSave(BuildContext context) async {
    try {
      var result = await BarcodeScanner.scan();
      String userJson = result.rawContent;
      if (userJson.isNotEmpty) {
        var userData = jsonDecode(userJson);
        String? name = userData['name'];
        List? phoneNumbers = userData['phoneNumbers'];

        if (name == null || phoneNumbers == null) {
          Fluttertoast.showToast(
              msg: '$userData is not a valid contact',
              textColor: Colors.white,
              backgroundColor: AppColors.secondary);
        } else {
          Navigator.pushNamed(context, SAVE_VIEW_ROUTE, arguments: userJson);
        }
      }
    } catch (e) {
      log(e.toString());
    }
    //_appContactsService.saveJsonAsContact(userJson);
  }
}
