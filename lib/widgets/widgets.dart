// import 'package:flutter/material.dart';
// import 'package:food_app/constants/colors.dart';
// import 'package:food_app/widgets/text.dart';

// Widget socialButton(String iconPath) {
//   return Container(
//     height: 64,
//     width: 108.68,
//     decoration: const BoxDecoration(
//         color: Color(0xffF5F5F5),
//         borderRadius: BorderRadius.all(Radius.circular(12))),
//     child: Center(
//       child: Image.asset(
//         iconPath,
//         width: 32,
//         height: 32,
//       ),
//     ),
//   );
// }

// Widget customButton(String title, {double? height, double? width}) {
//   return Container(
//     height: height ?? 56,
//     decoration: BoxDecoration(
//         color: primaryColor, borderRadius: BorderRadius.circular(12)),
//     child: Center(
//       child: customText(title,
//           color: whiteColor, fontWeight: FontWeight.w600, fontsize: 14),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/widgets/text.dart';

// Updated socialButton to be responsive
Widget socialButton(
  String iconPath,
) {
  return Container(
    height: 64.w,
    width: 108.68.h,
    decoration: const BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Center(
      child: Image.asset(
        iconPath,
        width: 32.w, // Make icon size responsive
        height: 32.h,
      ),
    ),
  );
}

// Updated customButton to be responsive
Widget customButton(String title,
    {double? height, double? width, double? fontsize}) {
  return Container(
    height: height ?? 56.h,
    width: width,
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: customText(
        title,
        color: whiteColor,
        fontWeight: FontWeight.w600,
        fontsize: fontsize ?? 14.sp, // Make text size responsive
      ),
    ),
  );
}
