import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';

class FloatingActionButtonPage extends StatelessWidget {
  const FloatingActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width * .92,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(homeImage, height: 24, width: 24),
            CircleAvatar(
              radius: 32,
              backgroundColor: primaryColor,
              child: Image.asset(cateringImage,
                  height: 24, width: 24, color: whiteColor),
            ),
            Image.asset(avtarImage, height: 24, width: 24),
          ],
        ),
      ),
    );
  }
}