import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/services/app_contacts_service.dart';
import 'package:scan_mo/core/services/shared_prefs_service.dart';

class ScanHomeViewModel extends BaseViewModel {
  SharedPrefsService sharedPrefs = locator<SharedPrefsService>();
  AppContactsService _appContactsService = locator<AppContactsService>();

  String get userName => sharedPrefs.name ?? 'User';

  scanAndSave() async {
    var result = await BarcodeScanner.scan();
    //print(result.rawContent);

    try {
      String userJson = result.rawContent;
      _appContactsService.saveJsonAsContact(userJson);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Qr code does not contain a valid contact');
    }
  }
}
