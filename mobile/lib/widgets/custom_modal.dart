// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';

void showModalFromRight(BuildContext context) {
  List<Map<String, dynamic>> optionsList = [
    {
      "id": 1,
      "title": "History Listen",
      "icon": "clock",
    },
    {
      "id": 2,
      "title": "History Listen",
      "icon": "clock",
    },
    {
      "id": 3,
      "title": "History Listen",
      "icon": "clock",
    },
  ];

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset(0.3, 0.0);
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return Center(
        child: Container(
          color: AppColor.primaryBackground,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: const Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/user_1.png'),
                            ),
                          ),
                          Text(
                            "Phan Doan Nhat",
                            // style: AppTextStyle.songTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: AppColor.unActiveTextColor,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    for (int i = 0; i < optionsList.length; i++)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Row(
                              children: [
                                Icon(Icons.history),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  optionsList[i]['title'],
                                  // style: AppTextStyle.heading,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
