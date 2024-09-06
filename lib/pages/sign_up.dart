import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/assets.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/dimension.dart';

import '../widgets/custom_text_form.dart';
import '../widgets/social_login_widget.dart';
import '../widgets/text.dart';
import '../widgets/widgets.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: 300.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(signUpImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230.0).w,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25.0).r,
                  topRight: const Radius.circular(25.0).r,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20.0)
                          .w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // App Logo
                      Container(
                        height: 5.h,
                        width: 72.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: dividerColor),
                      ),
                      height20(),
                      // Login Form
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText('Sign Up',
                                fontsize: 32.sp,
                                fontWeight: FontWeight.w700,
                                color: textColor),
                            height20(),
                            const SocialLoginWidget(),
                            height20(),
                            Center(
                              child: customText(
                                "Or, register with email",
                                fontsize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: textColor,
                              ),
                            ),
                            height20(),
                            customText("Full name",
                                fontsize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            customTextForm(
                              hintText: 'Type your name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This Field Can\'t be Empty.';
                                }
                                return null;
                              },
                            ),
                            height20(),
                            customText("Email address",
                                fontsize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            customTextForm(
                              hintText: 'Type your email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This Field Can\'t be Empty.';
                                }
                                return null;
                              },
                            ),
                            height20(),
                            customText("Password",
                                fontsize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            customTextForm(
                              hintText: 'Type your password',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This Field Can\'t be Empty.';
                                }
                                return null;
                              },
                            ),
                            height20(),
                            GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                child: customButton('Sign up')),
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customText(
                                  'Already have an account ? ',
                                  fontsize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  child: customText(
                                    ' Login',
                                    fontsize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
