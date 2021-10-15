import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan_mo/core/view_models/contacts_view_model.dart';
import 'package:scan_mo/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_mo/ui/views/home_view.dart';
import 'package:scan_mo/ui/views/onboarding_view.dart';
import 'package:scan_mo/core/routes.dart' as routes;

import 'core/services/permission_service.dart';
import 'core/services/shared_prefs_service.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();
  PermissionService permissionService = locator<PermissionService>();
  ContactsViewModel contactsModel = locator<ContactsViewModel>();
  await _sharedPrefsService.initialize();
  await permissionService.requestPermissions();
  runApp(ScanMo());
  contactsModel.getContacts();
}

class ScanMo extends StatefulWidget {
  @override
  State<ScanMo> createState() => _ScanMoState();
}

class _ScanMoState extends State<ScanMo> {
  final SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();
  @override
  initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scan mo',
        onGenerateRoute: routes.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: _sharedPrefsService.isOldUser! ? HomeView() : OnboardingView(),
      ),
    );
  }
}
