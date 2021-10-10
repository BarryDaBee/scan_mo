import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  // getContactsPermission() async {}
  void requestPermissions() async {
    PermissionStatus contactsPermission = await Permission.contacts.status;
    PermissionStatus cameraPermission = await Permission.camera.status;
    PermissionStatus phonePermission = await Permission.phone.status;

    if (cameraPermission.isGranted &&
        phonePermission.isGranted &&
        contactsPermission.isGranted) {
    } else {
      cameraPermission = await Permission.camera.request();
      phonePermission = await Permission.phone.request();
      contactsPermission = await Permission.contacts.request();
      if (cameraPermission.isGranted &&
          phonePermission.isGranted &&
          contactsPermission.isGranted) {
      } else {
        Fluttertoast.showToast(
            msg: 'Camera, Contacts, Call log and phone permission required');
        AppSettings.openAppSettings();
      }
    }
  }
}

// void getPermissionStatus() async {
//   PermissionStatus permission = awanHandler()
//   //       .checkPermissionStatus(PermissionGroup.stoit Permissiorage);
//   if (permission == PermissionStatus.granted) {
//   } // ideally you should specify another condition if permissions is denied
//   else if (permission == PermissionStatus.denied ||
//       permission == PermissionStatus.disabled ||
//       permission == PermissionStatus.restricted) {
//     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//     getPermissionStatus();
//   }
// }
