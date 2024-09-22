import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

Color? color;

abstract class AppStyles {
  static TextStyle blueTextStyle16 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16.sp,
    color: MyColors.blueColor,
    fontWeight: FontWeight.normal,
  );
  static TextStyle blueTextStyle16bold = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16.sp,
    color: MyColors.blueColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle blueTextStyle20bold = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20.sp,
    color: MyColors.blueColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle blueTextStyle12 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12.sp,
    color: MyColors.blueColor,
    fontWeight: FontWeight.normal,
  );
}
