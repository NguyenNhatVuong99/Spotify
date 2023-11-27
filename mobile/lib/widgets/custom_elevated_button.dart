import 'package:flutter/material.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required int width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.0,
      height: 80.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: AppColor.primaryColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 20.0, // Box shadow
        ),
        child: Text(
          text,
          style: AppTextStyle.instance.inputText,
        ),
      ),
    );
  }
}
