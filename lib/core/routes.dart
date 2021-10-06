import 'package:flutter/material.dart';
import 'package:scan_mo/core/route_constants.dart';
import 'package:scan_mo/ui/views/scan_home_view.dart';
import 'package:scan_mo/ui/views/onboarding_view.dart';
import 'package:scan_mo/ui/views/sign_up_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ScanHomeViewRoute:
      return MaterialPageRoute(builder: (context) => ScanHomeView());
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case OnboardingRoute:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case SignUpRoute:
      return MaterialPageRoute(builder: (context) => SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
