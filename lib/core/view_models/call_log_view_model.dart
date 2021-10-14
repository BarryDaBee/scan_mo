import 'package:call_log/call_log.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/services/call_log_service.dart';

class CallLogViewModel extends BaseViewModel {
  final callLogService = locator<CallLogService>();
  bool showBottomSheet = false;

  void toggleBottomSheet() {
    showBottomSheet = !showBottomSheet;
    notifyListeners();
  }

  Iterable<CallLogEntry>? callLogs;
  void getCallLogs() async {
    setBusy(true);
    callLogs = await callLogService.getCallLogs();

    setBusy(false);
  }
}
