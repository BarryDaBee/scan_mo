import 'package:flutter/material.dart';
import 'package:scan_mo/core/route_constants.dart';
import 'package:scan_mo/ui/route_animations.dart';
import 'package:scan_mo/ui/views/call_logs_view.dart';
import 'package:scan_mo/ui/views/contact_info_view.dart';
import 'package:scan_mo/ui/views/contacts_view.dart';
import 'package:scan_mo/ui/views/home_view.dart';
import 'package:scan_mo/ui/views/save_contact_view.dart';
import 'package:scan_mo/ui/views/scan_home_view.dart';
import 'package:scan_mo/ui/views/onboarding_view.dart';
import 'package:scan_mo/ui/views/share_friend_contact_view.dart';
import 'package:scan_mo/ui/views/share_personal_contact_view.dart';
import 'package:scan_mo/ui/views/sign_up_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SCAN_HOME_VIEW_ROUTE:
      return MaterialPageRoute(builder: (context) => ScanHomeView());
    case SAVE_VIEW_ROUTE:
      return MaterialPageRoute(
          settings: settings, builder: (context) => SaveContactView());
    case CALL_LOGS_VIEW_ROUTE:
      return MaterialPageRoute(builder: (context) => CallLogsView());
    case HOME_VIEW_ROUTE:
      return MaterialPageRoute(builder: (context) => HomeView());
    case CONTACT_INFO_ROUTE:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => ContactInfoView(),
      );
    case ONBOARDING_ROUTE:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case SHARE_FRIEND_CONTACT_ROUTE:
      return MaterialPageRoute(
          settings: settings, builder: (context) => ShareFriendContactView());
    case SIGN_UP_ROUTE:
      return SlideDownRoute(view: SignUpView());
    case SHARE_PERSONAL_CONTACT_ROUTE:
      return FadeInRoute(view: SharePersonalContactView());
    case CONTACTS_ROUTE:
      return FadeInRoute(view: ContactsView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
