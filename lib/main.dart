import 'package:flutter/material.dart';
import 'package:scan_mo/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_mo/ui/views/onboarding_view.dart';
import 'package:scan_mo/core/routes.dart' as routes;

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        home: OnboardingView(),
      ),
    );
  }
}
