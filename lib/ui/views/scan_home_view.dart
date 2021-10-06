import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/home_view_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dart:math' as math;

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

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
        ScanHomeView(),
        ScanHomeView(),
        ScanHomeView(),
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
          icon: Icon(Icons.phone),
          activeColorPrimary: BrandColors.secondary,
          inactiveColorPrimary: Colors.black.withOpacity(0.3),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'scan'.svg,
            color: isActiveIndex(1)
                ? BrandColors.secondary
                : Colors.black.withOpacity(0.3),
          ),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          activeColorPrimary: BrandColors.secondary,
          inactiveColorPrimary: Colors.black.withOpacity(0.3),
        ),
      ],
    );
  }

  bool isActiveIndex(int index) {
    return _controller.index == index;
  }
}

class ScanHomeView extends StatelessWidget {
  const ScanHomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 39.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              'Hey, Shola',
                              fontWeight: FontWeight.w700,
                              color: BrandColors.primary,
                              fontSize: 18,
                            ),
                            CustomText(
                              'Welcome Back',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: BrandColors.primary,
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: BrandColors.secondary,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CallToActionCard(
                      title: 'Share your contact with a friend',
                      imageUrl: 'assets/images/share_contact_with_friend.png',
                    ),
                    SizedBox(height: 30.h),
                    CallToActionCard(
                      title: 'Receive a contact from your friend',
                      imageUrl: 'assets/images/onboarding_phone_user.png',
                      rotateImage: true,
                      scaleBy: 1.2,
                    ),
                    SizedBox(height: 30.h),
                    CallToActionCard(
                      title: 'Share a friend\'s contact',
                      imageUrl: 'assets/images/share_friend_contact.png',
                      scaleBy: 1.5,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => HomeViewModel());
  }
}

class CallToActionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool rotateImage;
  final VoidCallback action;
  final double scaleBy;

  const CallToActionCard(
      {Key key,
      this.title,
      this.action,
      @required this.imageUrl,
      this.rotateImage = false,
      this.scaleBy = 1})
      : assert(imageUrl != null, 'imageUrl cannot be null'),
        assert(title != null, 'title cannot be null');
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: PhysicalModel(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(18.r),
        elevation: 4,
        child: Container(
          height: 186.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            gradient: LinearGradient(
              colors: [
                Color(0xFF9791D7).withOpacity(0.85),
                Color(0xFF574BCB),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 33.w,
                top: 48.h,
                child: CircleAvatar(
                  radius: 36.5.r,
                  backgroundColor: Color(0xFFF3980E),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: rotateImage
                    ? Transform.scale(
                        scale: scaleBy,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Image.asset(
                            imageUrl,
                            width: 146.w,
                            height: 186.h,
                          ),
                        ),
                      )
                    : Transform.scale(
                        scale: scaleBy,
                        child: Image.asset(
                          imageUrl,
                          width: 146.w,
                          height: 186.h,
                        ),
                      ),
              ),
              Positioned(
                right: 18.w,
                top: 61.h,
                child: SizedBox(
                  width: 149.h,
                  child: CustomText(
                    title,
                    fontSize: 18,
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
