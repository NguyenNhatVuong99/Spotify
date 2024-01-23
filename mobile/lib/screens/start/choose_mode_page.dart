// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spotify/configs/svg.dart';
import 'package:flutter_spotify/screens/home/base.dart';
import 'package:flutter_spotify/themes/app_assets.dart';
import 'package:flutter_spotify/themes/app_color.dart';
import 'package:flutter_spotify/themes/app_textstyle.dart';
import 'package:flutter_spotify/themes/provide_theme.dart';
import 'package:flutter_spotify/widgets/custom_elevated_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({Key? key}) : super(key: key);

  @override
  State<ChooseModePage> createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: themeProvider.isDarkTheme
            ? AppColor.primaryBackground
            : AppColor.whiteText2Color,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.ChooseMod), fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 30, bottom: MediaQuery.of(context).size.height / 2.5),
                child: SvgPicture.asset(AppSVG.logo),
              ),
              Center(
                child: Text(
                  'Choose mode',
                  style: AppTextStyle.heading,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(40),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: themeProvider.isDarkTheme
                                  ? AppColor.primaryColor
                                  : AppColor.primaryBackground,
                            ),
                            child: Center(
                              child: InkWell(
                                child: SvgPicture.asset(AppSVG.moon),
                                onTap: () {
                                  setState(() {
                                    themeProvider.setTheme(ThemeData.dark());
                                  });
                                },
                              ),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.all(40),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: themeProvider.isDarkTheme
                                  ? AppColor.primaryBackground
                                  : AppColor.primaryColor,
                            ),
                            child: Center(
                              child: InkWell(
                                child: SvgPicture.asset(AppSVG.sun),
                                onTap: () {
                                  setState(() {
                                    themeProvider.setTheme(ThemeData.light());
                                  });
                                },
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Base()),
                  );
                },
                text: 'Continue',
                width: 320,
              )
            ],
          ),
        ));
  }
}
