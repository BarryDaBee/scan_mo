import 'package:flutter/material.dart';
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
  permissionService.requestPermissions();
  await _sharedPrefsService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();
  @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: routes.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _sharedPrefsService.isOldUser! ? HomeView() : OnboardingView(),
      ),
    );
  }
}
