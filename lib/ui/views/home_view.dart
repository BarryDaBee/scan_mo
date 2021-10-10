import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/routes.dart';
import 'contacts_view.dart';
import 'scan_home_view.dart';

import 'call_logs_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        CallLogsView(),
        ScanHomeView(),
        ContactsView(),
      ],
      backgroundColor: Colors.white,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style2,
      onItemSelected: (_) {
        setState(() {});
      },
      items: [
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          icon: SvgPicture.asset(
            'calling'.svg,
            color: isActiveIndex(0)
                ? AppColors.secondary
                : Colors.black.withOpacity(0.3),
          ),
        ),
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          icon: SvgPicture.asset(
            'scan'.svg,
            color: isActiveIndex(1)
                ? AppColors.secondary
                : Colors.black.withOpacity(0.3),
          ),
        ),
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          icon: SvgPicture.asset(
            'profile'.svg,
            color: isActiveIndex(2)
                ? AppColors.secondary
                : Colors.black.withOpacity(0.3),
          ),
          activeColorPrimary: AppColors.secondary,
          inactiveColorPrimary: Colors.black.withOpacity(0.3),
        ),
      ],
    );
  }

  bool isActiveIndex(int index) {
    return _controller.index == index;
  }
}
