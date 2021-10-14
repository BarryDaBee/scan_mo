import 'dart:convert';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:scan_mo/core/exports.dart';

class ShareFriendContactView extends StatelessWidget {
  ShareFriendContactView({Key? key}) : super(key: key);

  _getShortenedName(String name) {
    if (name.length > 15) {
      return name.substring(0, 15);
    } else {
      return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final contact =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: Navigator.of(context).pop,
                  child: Container(
                    height: 30.r,
                    width: 30.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.secondary),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15.r,
                    ),
                  ),
                ),
                SizedBox(
                  width: 221.w,
                  child: CustomText(
                    'Share a friend\'s contact',
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontSize: 23,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(),
              ],
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundColor: AppColors.yellow,
                    child: CustomText(
                      contact['name'][0].toUpperCase(),
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomText(
                    _getShortenedName(contact['name']).toUpperCase(),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            Container(
              height: 371.h,
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.38),
                borderRadius: BorderRadius.circular(18),
              ),
              child: QrImage(
                data: jsonEncode(contact),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
