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
}
