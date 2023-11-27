import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/configs/svg.dart';
import 'package:mobile/themes/app_color.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 170, 170),
      body: Center(
        child: SvgPicture.asset(AppSVG.logo),
      ),
    );
  }
}
