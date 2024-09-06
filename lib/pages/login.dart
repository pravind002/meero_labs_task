import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/assets.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/dimension.dart';
import 'package:food_app/widgets/text.dart';

import '../widgets/custom_text_form.dart';
import '../widgets/social_login_widget.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                image: AssetImage(loginImage),
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
                            borderRadius: BorderRadius.circular(12.r),
                            color: dividerColor),
                      ),
                      height20(),
                      // Login Form
                      Form(
                        key: _formKey,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText('Login',
                                fontsize: 32.sp,
                                fontWeight: FontWeight.w700,
                                color: textColor),
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
                              hintText: 'Type your password.',
                              obscureText: true,
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
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  }
                                },
                                child: customButton('Login')),
                            height20(),
                            Center(
                              child: customText(
                                "Or, login with",
                                fontsize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                            height20(),
                            const SocialLoginWidget(),
                            SizedBox(height: 50.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customText(
                                  'Haven’t account ? ',
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
                                                const SignUpScreen()));
                                  },
                                  child: customText(
                                    ' Register now',
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
