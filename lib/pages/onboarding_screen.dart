import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/widgets/widgets.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0; // Make _currentIndex dynamic
  final CarouselController _sliderController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Image.asset(
                  cookBgImage,
                  fit: BoxFit.cover,
                  width: screenWidth,
                ),
                const SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
          Positioned(
            bottom: -15,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .47,
                  child: Image.asset(
                    whiteBgImage,
                    width: screenWidth,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  top: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: CarouselSlider.builder(
                            carouselController: _sliderController,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Column(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "The Fastest In \n Delivery ",
                                    style: TextStyle(
                                      fontSize: 36.sp,
                                      fontWeight: FontWeight.w700,
                                      color: textColor,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: "Food",
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "Our job is to fill your tummy with delicious \n food and fast delivery.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5.sp,
                                      letterSpacing: 0.15,
                                      color: const Color(0xff888888)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Container(
                              width: _currentIndex == index ? 24 : 8,
                              height: 8.h,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: _currentIndex == index
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: customButton('Get Started'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
