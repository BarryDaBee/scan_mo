import 'package:flutter/material.dart';
import 'package:scan_mo/core/exports.dart';
import 'dart:math' as math;

class CallToActionCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final bool? rotateImage;
  final VoidCallback? action;
  final double? scaleBy;

  const CallToActionCard(
      {Key? key,
      @required this.title,
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
                  backgroundColor: BrandColors.yellow,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: rotateImage!
                    ? Transform.scale(
                        scale: scaleBy!,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Image.asset(
                            imageUrl!,
                            width: 146.w,
                            height: 186.h,
                          ),
                        ),
                      )
                    : Transform.scale(
                        scale: scaleBy!,
                        child: Image.asset(
                          imageUrl!,
                          width: 146.w,
                          height: 186.h,
                        ),
                      ),
              ),
              Positioned(
                right: 18.w,
                top: 61.h,
                child: SizedBox(
                  width: 149.w,
                  child: CustomText(
                    title!,
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
