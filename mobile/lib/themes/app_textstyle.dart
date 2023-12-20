import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle authTitle = const TextStyle(
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.w700,
      fontSize: 30,
      color: AppColor.whiteText2Color);
  TextStyle inputText = const TextStyle(
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: AppColor.whiteText2Color);

  static const TextStyle heading = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Satoshi',
  );
  static const TextStyle songTitle = TextStyle(
    color: Color(0xFFE1E1E1),
    fontSize: 16,
    fontWeight: FontWeight.w700,
    // fontFamily: 'Satoshi',
  );
  static const TextStyle artistName = TextStyle(
    color: Color(0xFFBFBEBE),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Satoshi',
  );
  static const TextStyle artistNameMin = TextStyle(
    color: Color(0xFFD6D6D6),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Satoshi',
  );
  static const TextStyle time = TextStyle(
    color:  Color(0xFFD6D6D6),
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: 'Satoshi',
  );
  static const TextStyle favListTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Satoshi',
  );
}
