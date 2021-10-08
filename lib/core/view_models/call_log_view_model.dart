import 'package:call_log/call_log.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/services/call_log_service.dart';
import 'package:scan_mo/core/services/permission_service.dart';

class CallLogHomeViewModel extends BaseViewModel {
  final callLogService = locator<CallLogService>();
  Iterable<CallLogEntry>? callLogs;
  final permissionService = locator<PermissionService>();
  void getCallLogs() async {
    //await permissionService.getContactsPermission();
    setBusy(true);
    callLogs = await callLogService.getCallLogs();

    setBusy(false);
  }
}
