// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mobile/themes/app_assets.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';

class ThumbnailComponents extends StatelessWidget {
  const ThumbnailComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Container(
            width: 334,
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              color: AppColor.primaryColor,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    width: 200,
                    height: 20,
                    child: Text(
                      'New album',
                      textAlign: TextAlign.left,
                      // style: AppTextStyle.songTitle,
                    ),
                  ),
                ),
                Positioned(
                  top: 35,
                  left: 15,
                  child: Container(
                    width: 120,
                    height: 55,
                    child: Text(
                      'Happier Than Ever',
                      textAlign: TextAlign.left,
                      // style: AppTextStyle.heading,
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 15,
                  child: Container(
                    width: 200,
                    height: 30,
                    child: Text(
                      'Billie Eilish',
                      textAlign: TextAlign.left,
                      // style: AppTextStyle.songTitle,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 30,
                  child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        AppAssets.AvatarThumbnail,
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                    top: 15, right: 15, child: Image.asset(AppAssets.Union)),
              ],
            )),
      ),
    );
  }
}
