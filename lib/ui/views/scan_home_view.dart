import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/scan_home_view_model.dart';

import 'package:scan_mo/ui/widgets/call_to_action_card.dart';

class ScanHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanHomeViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 39.w,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 2 / 3,
                              child: CustomText(
                                'Hey, ${model.userName}',
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: 18,
                              ),
                            ),
                            CustomText(
                              'Welcome Back',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            /// TODO: Add edit profile dialog
                          },
                          child: Hero(
                            tag: 'avatar',
                            child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: AppColors.yellow,
                              child: CustomText(
                                model.userName[0],
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CallToActionCard(
                      title: 'Share your contact with a friend',
                      imageUrl: 'assets/images/share_contact_with_friend.png',
                      action: () {
                        Navigator.pushNamed(
                            context, SHARE_PERSONAL_CONTACT_ROUTE);
                      },
                    ),
                    SizedBox(height: 30.h),
                    CallToActionCard(
                      title: 'Receive a contact from your friend',
                      imageUrl: 'assets/images/onboarding_phone_user.png',
                      rotateImage: true,
                      scaleBy: 1.2,
                      action: () {
                        model.scanAndSave(context);
                      },
                    ),
                    SizedBox(height: 30.h),
                    CallToActionCard(
                      title: 'Share a friend\'s contact',
                      imageUrl: 'assets/images/share_friend_contact.png',
                      scaleBy: 1.5,
                      action: () {
                        Navigator.pushNamed(context, CONTACTS_ROUTE);
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<ScanHomeViewModel>());
  }
}
