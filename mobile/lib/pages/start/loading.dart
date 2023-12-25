import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/configs/constant_svg.dart';
import 'package:mobile/themes/app_color.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackBackground1Color,
      body: Center(
        child: SvgPicture.asset(ConstantSvg.logo),
      ),
    );
  }
}
