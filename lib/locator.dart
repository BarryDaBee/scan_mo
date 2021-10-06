import 'package:get_it/get_it.dart';
import 'package:scan_mo/core/services/app_contacts_service.dart';
import 'package:scan_mo/core/services/permission_service.dart';
import 'package:scan_mo/core/view_models/onboarding_view_model.dart';

import 'core/view_models/home_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => OnboardingViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => AppContactsService());
  locator.registerFactory(() => PermissionService());
}
