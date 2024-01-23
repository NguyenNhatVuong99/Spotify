import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spotify/configs/svg.dart';
import 'package:flutter_spotify/screens/start/get_start_page.dart';
import 'package:flutter_spotify/themes/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: Center(
        child: SvgPicture.asset(AppSVG.logo),
      ),
    );
  }
}
