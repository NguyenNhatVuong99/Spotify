// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobile/pages/feature_page/components/songs_list.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class listTitleComponent extends StatefulWidget {
  @override
  _listTitleState createState() => _listTitleState();
}

class _listTitleState extends State<listTitleComponent> {
  List<String> ListTitle = ['News', 'Video', 'Artists', 'Podcast'];
  int _CurrentIndexOfTitle = 0;

  // static const List<Widget> _widgetOptions = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < ListTitle.length; i++)
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _CurrentIndexOfTitle = i;
                              });
                            },
                            child: Container(
                              color: AppColor.primaryBackground,
                              child: Text(ListTitle[i],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontFamily: 'Satoshi',
                                      color: _CurrentIndexOfTitle == i
                                          ? AppColor.activeTextColor
                                          : AppColor.unActiveTextColor)),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              SongsList()
            ],
          ),
        ));
  }
}
