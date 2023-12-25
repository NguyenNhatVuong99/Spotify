// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mobile/models/Tracks.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/configs/svg.dart';
import 'package:mobile/widgets/constain_icon.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/services/getTracks.dart';
import 'package:mobile/widgets/truncate_text.dart';

class playListComponents extends StatefulWidget {
  const playListComponents({super.key});

  @override
  State<playListComponents> createState() => _playListState();
}

class _playListState extends State<playListComponents> {
  // late Future<Tracks> tracks;
  late List tracks;

  @override
  void initState() {
    super.initState();
    fetchTracks().then((data) => {
          setState(() {
            tracks = data;
          })
        });
  }

  displayTracks() {
    print(tracks);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 34),
                    child: Text(
                      'Playlist',
                      // style: AppTextStyle.heading,
                      textAlign: TextAlign.left,
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Padding(
                    padding: EdgeInsets.only(right: 34),
                    child: Text(
                      'See More',
                      // style: AppTextStyle.artistNameMin,
                      textAlign: TextAlign.right,
                    ),
                  )),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              for (var track in tracks)
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 70,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 10, bottom: 10),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColor.secondaryColor,
                                    ),
                                    child: InkWell(
                                        onTap: () {},
                                        child: ContainsIcon(
                                          path: AppSVG.play,
                                          size: 18,
                                        )),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      // Padding(
                                      //   padding:
                                      //       EdgeInsets.only(top: 5, bottom: 5),
                                      //   child: Text(truncateText(track["name"]),
                                      //       // style: AppTextStyle.songTitle),
                                      // ),
                                      // Text(truncateText(track["album"]["artist"]["name"]),
                                      //     overflow: TextOverflow.ellipsis,
                                      // style: AppTextStyle.artistNameMin),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text(
                                '5:33',
                                // style: AppTextStyle.time,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(AppSVG.heart)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
