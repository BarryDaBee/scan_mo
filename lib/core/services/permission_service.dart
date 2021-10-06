import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> getContactsPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (!permission.isGranted &&
        !permission.isDenied &&
        !permission.isPermanentlyDenied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts];
    }

    return permission;
  }
}
