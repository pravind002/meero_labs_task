import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/widgets/text.dart';

class TodaysMealPage extends StatelessWidget {
  TodaysMealPage({super.key});

  // Define meal periods
  final List<Map<String, dynamic>> mealsData = [
    {
      'title': 'Snacks',
      'image': 'assets/images/snacks (4).png',
      'startHour': 0,
      'endHour': 5
    },
    {
      'title': 'Breakfast',
      'image': 'assets/images/snacks (1).png',
      'startHour': 6,
      'endHour': 11
    },
    {
      'title': 'Lunch',
      'image': 'assets/images/snacks (2).png',
      'startHour': 12,
      'endHour': 16
    },
    {
      'title': 'Dinner',
      'image': 'assets/images/snacks (3).png',
      'startHour': 17,
      'endHour': 23
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Get the current time in Indian Standard Time (IST)
    DateTime currentTime =
        DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
    int currentHour = currentTime.hour;

    // Find the current meal based on the current hour
    String currentMeal = '';
    for (var meal in mealsData) {
      if (currentHour >= meal['startHour'] && currentHour <= meal['endHour']) {
        currentMeal = meal['title'];
        break;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < mealsData.length; i++) ...[
          Padding(
            padding: const EdgeInsets.only(left: 12).w,
            child: Column(
              children: [
                Container(
                  width: 72.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 2,
                        color: mealsData[i]['title'] == currentMeal
                            ? primaryColor
                            : transpaarentColor),
                    color: mealsData[i]['title'] == currentMeal
                        ? primaryColor
                            .withOpacity(.25) // Highlight the current meal
                        : lightColor,
                  ),
                  child: Center(
                      child: Image.asset(
                    '${mealsData[i]['image']}',
                    height: 48.h,
                    width: 48.w,
                  )),
                ),
                const SizedBox(height: 5),
                customText('${mealsData[i]['title']}',
                    fontsize: 14.sp, fontWeight: FontWeight.w600),
              ],
            ),
          )
        ]
      ],
    );
  }
}
