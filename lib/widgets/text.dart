import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';

Text customText(String text,
    {Color? color,
    double? height,
    double? fontsize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextOverflow? overflow,int? maxLines,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    maxLines:maxLines ,
    style: TextStyle(
        height: height,
        
        color: color ?? textColor,
        overflow: overflow,
        fontSize: fontsize ?? 14.sp,
        decoration: decoration,
        fontWeight: fontWeight),
  );
}
