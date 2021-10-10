import 'package:flutter/material.dart';
import 'package:scan_mo/ui/shared/colors.dart';
import 'package:scan_mo/ui/widgets/animated_flat_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageIndicator extends StatelessWidget {
  final int? noOfPages;
  final int? currentIndex;

  const CustomPageIndicator({@required this.noOfPages, this.currentIndex})
      : assert(noOfPages != 0, 'Number of pages cannot be zero');
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(noOfPages!, (index) {
        if (index == currentIndex) {
          return AnimatedFlatIndicator();
        } else {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            height: 10.r,
            width: 10.r,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.grey),
          );
        }
      }),
    );
  }
}
