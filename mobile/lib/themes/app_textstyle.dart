import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();
  static const TextStyle heading = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Satoshi',
  );
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
    color: AppColor.primaryColor,
    fontSize: 14,
    fontFamily: 'satoshi',
    fontWeight: FontWeight.w700,
  );
  TextStyle diaLogStyle = const TextStyle(
    color: AppColor.blackBackground1Color,
    fontSize: 20,
    fontFamily: 'satoshi',
    fontWeight: FontWeight.bold,
  );
  TextStyle textStyeDialog = const TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.blackBackground1Color,
      fontSize: 20);

  // static const TextStyle heading = TextStyle(
  //   color: Colors.white,
  //   fontSize: 20,
  //   fontWeight: FontWeight.w700,
  //   fontFamily: 'Satoshi',
  // );
  // static const TextStyle songTitle = TextStyle(
  //   color: Color(0xFFE1E1E1),
  //   fontSize: 16,
  //   fontWeight: FontWeight.w700,
  //   // fontFamily: 'Satoshi',
  // );
  // static const TextStyle artistName = TextStyle(
  //   color: Color(0xFFBFBEBE),
  //   fontSize: 14,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: 'Satoshi',
  // );
  // static const TextStyle artistNameMin = TextStyle(
  //   color: Color(0xFFD6D6D6),
  //   fontSize: 12,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: 'Satoshi',
  // );
  // static const TextStyle time = TextStyle(
  //   color:  Color(0xFFD6D6D6),
  //   fontSize: 15,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: 'Satoshi',
  // );
  // static const TextStyle favListTitle = TextStyle(
  //   color: Colors.white,
  //   fontSize: 16,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: 'Satoshi',
  // );
}
