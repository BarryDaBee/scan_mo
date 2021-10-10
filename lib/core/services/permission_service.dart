import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  // getContactsPermission() async {}
  void requestContactPermission() async {
    // final PermissionStatus contactsPermission =
    //     await Permission.contacts.status;
    // final PermissionStatus cameraPermission = await Permission.camera.status;
    // final PermissionStatus phonePermission = await Permission.phone.status;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.camera,
      Permission.contacts,
    ].request();
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
