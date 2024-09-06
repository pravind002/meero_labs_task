import 'package:flutter/material.dart';

import '../constants/colors.dart';

TextFormField customTextForm(
    {String? hintText,
    String? Function(String?)? validator,
    bool obscureText = false}) {
  return TextFormField(
      obscureText: obscureText,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff888888),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: validator
      // onChanged: (value) {
      //   setState(() {
      //     email = value;
      //   });
      // },
      );
}
