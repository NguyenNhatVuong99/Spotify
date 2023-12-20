// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile/pages/favorite_page/components/options_list.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';

class favoritePage extends StatefulWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  State<favoritePage> createState() => _favoriteState();
}

class _favoriteState extends State<favoritePage> {
  int _currentOption = 0;
  List<String> options = ["Artist", "Songs"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      appBar: AppBar(
        backgroundColor: AppColor.primaryBackground,
        title: Center(
          child: Text(
            'Following',
            style: AppTextStyle.heading,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                children: [
                  for (var i = 0; i < options.length; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _currentOption = i;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height,
                        color: options[_currentOption] == options[i]
                            ? AppColor.unActiveTextColor
                            : AppColor.primaryBackground,
                        child: Center(
                          child: Text(
                            options[i],
                            style: AppTextStyle.songTitle,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OptionsListComponent(),
          ],
        ),
      ),
    );
  }
}
