// ignore_for_file: avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';
import 'package:mobile/pages/profile_page/components/fav_playlist.dart';
import 'package:mobile/themes/app_assets.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profileState();
}

class _profileState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Profile',
            style: AppTextStyle.heading,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
        elevation: 0,
        backgroundColor: AppColor.profileBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36.0),
                  bottomRight: Radius.circular(36.0),
                ),
                color: AppColor.profileBackground,
              ),
              child: Stack(
                children: [
                   Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(AppAssets.Union)
                  ),
                  Positioned(
                    top: 20,
                    left: (MediaQuery.of(context).size.width / 2) - 60,
                    width: 93,
                    height: 93,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(AppAssets.User1),
                    ),
                  ),
                  Positioned(
                    top: 123,
                    left: (MediaQuery.of(context).size.width / 2) - 93,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Soroushnorozyui@gmail.com',
                      style: AppTextStyle.artistNameMin,
                    ),
                  ),
                  Positioned(
                    top: 143,
                    left: (MediaQuery.of(context).size.width / 2) - 65,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Soroushnrz',
                      style: AppTextStyle.heading,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: (MediaQuery.of(context).size.width / 4),
                    child: Container(
                      child: const Column(
                        children: [
                          Text(
                            '778',
                            style: AppTextStyle.heading,
                          ),
                          Text(
                            'Followers',
                            style: AppTextStyle.artistName,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: (MediaQuery.of(context).size.width / 1.8),
                    child: Container(
                      child: const Column(
                        children: [
                          Text(
                            '243',
                            style: AppTextStyle.heading,
                          ),
                          Text(
                            'Following',
                            style: AppTextStyle.artistName,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const favoritePlayListComponents()
          ],
        ),
      ),
    );
  }
}
