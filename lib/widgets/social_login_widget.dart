import 'package:flutter/material.dart';

import '../constants/assets.dart';
import 'widgets.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        socialButton(googgleImage),
        socialButton(facebookImage),
        socialButton(appleImage),
      ],
    );
  }
}
