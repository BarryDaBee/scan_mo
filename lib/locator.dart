import 'package:get_it/get_it.dart';
import 'package:scan_mo/core/services/app_contacts_service.dart';
import 'package:scan_mo/core/services/permission_service.dart';
import 'package:scan_mo/core/view_models/onboarding_view_model.dart';
import 'core/services/call_log_service.dart';
import 'core/services/shared_prefs_service.dart';
import 'core/view_models/call_log_view_model.dart';
import 'core/view_models/contacts_view_model.dart';
import 'core/view_models/scan_home_view_model.dart';
import 'core/view_models/share_personal_contact_view_model.dart';
import 'core/view_models/sign_up_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
      .registerLazySingleton<OnboardingViewModel>(() => OnboardingViewModel());
  locator.registerLazySingleton<ScanHomeViewModel>(() => ScanHomeViewModel());
  locator.registerLazySingleton<CallLogViewModel>(() => CallLogViewModel());
  locator.registerLazySingleton<ContactsViewModel>(() => ContactsViewModel());
  locator.registerLazySingleton<SharePersonalContactViewModel>(
      () => SharePersonalContactViewModel());
  locator.registerLazySingleton<SignUpViewModel>(() => SignUpViewModel());

  locator.registerLazySingleton<AppContactsService>(() => AppContactsService());
  locator.registerLazySingleton<CallLogService>(() => CallLogService());
  locator.registerLazySingleton<SharedPrefsService>(() => SharedPrefsService());
  locator.registerLazySingleton<PermissionService>(() => PermissionService());
}
