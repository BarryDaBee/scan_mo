import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scan_mo/core/exports.dart';

class SharePersonalContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        shape: BoxShape.circle, color: BrandColors.secondary),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15.r,
                    ),
                  ),
                ),
                SizedBox(
                  width: 221.w,
                  child: Text(
                    'Share your personal contact',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: BrandColors.primary,
                      fontSize: 23,
                    ),
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
                color: BrandColors.secondary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundColor: BrandColors.yellow,
                    child: CustomText(
                      'S',
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomText(
                    'BOLU FE. DEV',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            Container(
              height: 392.h,
              child: Stack(
                children: [
                  Container(
                    height: 371.h,
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      color: BrandColors.secondary.withOpacity(0.38),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: QrImage(
                      data: 'Hello, I\'m Barry',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10.w,
                    child: SelectedSimCard(
                      isActive: true,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10.w,
                    child: SelectedSimCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedSimCard extends StatelessWidget {
  final bool isActive;

  const SelectedSimCard({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? BrandColors.yellow : BrandColors.grey,
        borderRadius: BorderRadius.circular(18),
      ),
      height: 47.h,
      width: 135.w,
    );
  }
}
