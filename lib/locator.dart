import 'package:get_it/get_it.dart';
import 'package:scan_mo/core/services/app_contacts_service.dart';
import 'package:scan_mo/core/services/permission_service.dart';
import 'package:scan_mo/core/view_models/onboarding_view_model.dart';
import 'core/services/call_log_service.dart';
import 'core/view_models/call_log_view_model.dart';
import 'core/view_models/contacts_view_model.dart';
import 'core/view_models/scan_home_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<OnboardingViewModel>(() => OnboardingViewModel());
  locator.registerFactory<ScanHomeViewModel>(() => ScanHomeViewModel());
  locator.registerFactory<CallLogViewModel>(() => CallLogViewModel());
  locator.registerFactory<ContactsViewModel>(() => ContactsViewModel());
  locator.registerFactory<AppContactsService>(() => AppContactsService());
  locator.registerFactory<CallLogService>(() => CallLogService());
  locator.registerFactory<PermissionService>(() => PermissionService());
}
