import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/services/shared_prefs_service.dart';

class ScanHomeViewModel extends BaseViewModel {
  SharedPrefsService service = locator<SharedPrefsService>();
  String get userName => service.name ?? 'User';
}
