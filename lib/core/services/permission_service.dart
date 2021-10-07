import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> getContactsPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (!permission.isGranted &&
        !permission.isDenied &&
        !permission.isPermanentlyDenied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      print("requested");
      return permissionStatus[Permission.contacts];
    }

    return permission;
  }
  // void getPermissionStatus() async {
  //   PermissionStatus permission = await PermissionHandler()
  //       .checkPermissionStatus(PermissionGroup.storage);
  //   if (permission == PermissionStatus.granted) {
  //   } // ideally you should specify another condition if permissions is denied
  //   else if (permission == PermissionStatus.denied ||
  //       permission == PermissionStatus.disabled ||
  //       permission == PermissionStatus.restricted) {
  //     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  //     getPermissionStatus();
  //   }
  // }
}
