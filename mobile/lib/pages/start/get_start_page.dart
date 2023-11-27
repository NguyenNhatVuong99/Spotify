import 'package:flutter/material.dart';
import 'package:mobile/themes/app_textstyle.dart';
import 'package:mobile/widgets/custom_elevated_button.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sign in',
          style: AppTextStyle.instance.authTitle,
        ),
        CustomElevatedButton(
          text: 'Sign In',
          width: 150,
          onPressed: () {
            // Add your button press logic here
            print('Button Pressed');
          },
        )
      ],
    )));
  }
}
