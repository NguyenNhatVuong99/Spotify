// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spotify/configs/svg.dart';
import 'package:flutter_spotify/screens/auth/auth_page.dart';
import 'package:flutter_spotify/screens/start/choose_mode_page.dart';
import 'package:flutter_spotify/themes/app_assets.dart';
import 'package:flutter_spotify/themes/app_textstyle.dart';
import 'package:flutter_spotify/widgets/custom_elevated_button.dart';
import 'package:flutter_svg/flutter_svg.dart';


class GetStartPage extends StatelessWidget {
  const GetStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.Started), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 30, bottom: MediaQuery.of(context).size.height / 2.5),
              child: SvgPicture.asset(AppSVG.logo),
            ),
            // Center(
            //   child: Text(
            //     'Enjoy listening to music',
            //     style: AppTextStyle.heading,
            //   ),
            // ),
            
            CustomElevatedButton(
              text: 'Get started',
              width: 118,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AuthPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
