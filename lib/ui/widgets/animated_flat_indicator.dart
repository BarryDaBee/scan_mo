import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_mo/ui/shared/colors.dart';

class AnimatedFlatIndicator extends StatefulWidget {
  const AnimatedFlatIndicator({
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedFlatIndicatorState createState() => _AnimatedFlatIndicatorState();
}

class _AnimatedFlatIndicatorState extends State<AnimatedFlatIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      width: 30.w * _controller!.value,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        color: AppColors.primary,
      ),
    );
  }
}
