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
  TextStyle titleText = const TextStyle(
    color: AppColor.grayTitleColor,
    fontSize: 26,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w600,
  );
  TextStyle textLetter = const TextStyle(
    color: AppColor.grayText1Color,
    fontSize: 17,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
  );
  TextStyle textButton = const TextStyle(
    // Register
    color: Colors.white,
    fontSize: 19,
    fontFamily: "satoshi",
    fontWeight: FontWeight.w700,
  );
  TextStyle smallText = const TextStyle(
    color: AppColor.whiteText2Color,
    fontSize: 12,
    fontFamily: 'satoshi',
    fontWeight: FontWeight.w400,
  );
  TextStyle smallTextColor = const TextStyle(
    color: AppColor.primaryTextColor,
    fontSize: 12,
    fontFamily: 'satoshi',
    fontWeight: FontWeight.w400,
  );
  TextStyle textFooter = const TextStyle(
    color: AppColor.grayText1Color,
    fontSize: 14,
    fontFamily: 'satoshi',
    fontWeight: FontWeight.w700,
  );
  TextStyle textFooterColor = const TextStyle(
    color: AppColor.blueTextColor,
    fontSize: 14,
    fontFamily: 'satoshi',
    fontWeight: FontWeight.w700,
  );
}
