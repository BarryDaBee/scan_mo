import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:google_fonts/google_fonts.dart";

class CustomText extends StatelessWidget {
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  CustomText(this.text,
      {this.fontWeight,
      this.fontSize,
      this.color,
      this.textAlign,
      this.textOverflow});
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: textOverflow,
      style: GoogleFonts.poppins(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
    );
  }
}
