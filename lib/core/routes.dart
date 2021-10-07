import 'package:flutter/material.dart';
import 'package:scan_mo/core/route_constants.dart';
import 'package:scan_mo/ui/views/call_logs_home_view.dart';
import 'package:scan_mo/ui/views/home_view.dart';
import 'package:scan_mo/ui/views/scan_home_view.dart';
import 'package:scan_mo/ui/views/onboarding_view.dart';
import 'package:scan_mo/ui/views/share_personal_contact_view.dart';
import 'package:scan_mo/ui/views/sign_up_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ScanHomeViewRoute:
      return MaterialPageRoute(builder: (context) => ScanHomeView());
    case CALL_LOGS_VIEW_ROUTE:
      return MaterialPageRoute(builder: (context) => CallLogsHomeView());
    case HOME_VIEW_ROUTE:
      return MaterialPageRoute(builder: (context) => HomeView());
    case ONBOARDING_ROUTE:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case SIGN_UP_ROUTE:
      return MaterialPageRoute(builder: (context) => SignUpView());
    case SHARE_PERSONAL_CONTACT_ROUTE:
      return MaterialPageRoute(
          builder: (context) => SharePersonalContactView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
