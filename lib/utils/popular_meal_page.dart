import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../widgets/text.dart';

class PopularMealPaage extends StatelessWidget {
  PopularMealPaage({super.key});

  final List<String> imaages = [
    'assets/images/popular (1).png',
    'assets/images/popular (2).png',
    'assets/images/popular (3).png',
    'assets/images/popular (4).png',
    'assets/images/popular (5).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText("Popular now",
                fontsize: 16.sp, fontWeight: FontWeight.w500),
            customText("See all",
                fontsize: 14.sp,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                color: text2Color),
          ],
        ),
        // const SizedBox(height: 10),
        Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < imaages.length; i++) ...[
                Container(
                  width: MediaQuery.of(context).size.width * .42,
                  height: 300.h,
                  margin: const EdgeInsets.all(6).w,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Expanded(
                            child: Container(
                              // height: 310,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: lightColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  customText('Bhuna Khichuri and Thai Chiken',
                                      color: textColor,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: warningColor,
                                          ),
                                          customText('4.8',
                                              color: textColor,
                                              fontsize: 12,
                                              fontWeight: FontWeight.w400)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/vector.png',
                                            height: 16,
                                            width: 16,
                                          ),
                                          customText('150 Kcal',
                                              color: textColor,
                                              fontsize: 12,
                                              fontWeight: FontWeight.w400)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          customText('BDT  ',
                                              color: primaryColor,
                                              fontsize: 14,
                                              fontWeight: FontWeight.w600),
                                          customText('250',
                                              color: textColor,
                                              fontsize: 22,
                                              fontWeight: FontWeight.w500)
                                        ],
                                      ),
                                      Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(6.86)),
                                        child: const Icon(
                                          Icons.add,
                                          color: whiteColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(10).w,
                          child: Image.asset(
                            imaages[i],
                            height: 170.h,
                            width: 170.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ],
          ),
        )
      ],
    );
  }
}
