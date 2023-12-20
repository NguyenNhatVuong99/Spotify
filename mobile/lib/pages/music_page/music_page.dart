// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, , sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:mobile/themes/app_assets.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/configs/svg.dart';
import 'package:mobile/widgets/constain_icon.dart';

class playerMusicPage extends StatefulWidget {
  @override
  State<playerMusicPage> createState() => _PlayerState();
}

class _PlayerState extends State<playerMusicPage> {
  double _currentTimePlayer = 5.0;
  double startTime = 0.0;
  double endTime = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryBackground,
        appBar: AppBar(
          backgroundColor: AppColor.primaryBackground,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          title: Center(
            child: Text(
              'Now Playing',
              style: AppTextStyle.songTitle,
            ),
          ),
          actions: [Icon(Icons.more_vert)],
        ),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(AppAssets.Song1),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Bad Guy',
                                  style: AppTextStyle.songTitle,
                                ),
                                Text(
                                  'Billie Eilish',
                                  style: AppTextStyle.artistName,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 180,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                AppSVG.heart,
                                width: 20,
                                height: 20,
                              )),
                        ],
                      ),
                    ),
                    Slider(
                        value: _currentTimePlayer,
                        min: startTime,
                        max: endTime,
                        activeColor: AppColor.activeTextColor,
                        inactiveColor: AppColor.unActiveTextColor,
                        onChanged: (double value) {
                          setState(() {
                            _currentTimePlayer = value;
                          });
                        }),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: Row(
                          children: [
                            Text(
                              '$startTime',
                              style: AppTextStyle.time,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 140,
                            ),
                            Text(
                              '$endTime',
                              style: AppTextStyle.time,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppSVG.repeate)),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppSVG.previous)),
                          ),
                          Expanded(
                            child: Container(
                              width: 84,
                              height: 84,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColor.primaryColor),
                              child: IconButton(
                                icon: ContainsIcon(
                                path: AppSVG.pause,
                                size: 32,
                              ),
                              onPressed: () {},
                              )
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppSVG.next)),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(AppSVG.shuffle),
                              color: AppColor.unActiveTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Center(
                          child: ContainsIcon(
                        path: AppSVG.goToTop,
                        size: 32,
                      )),
                    )
                  ],
                ),
              )),
        ));
  }
}
