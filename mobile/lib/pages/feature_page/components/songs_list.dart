// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile/pages/music_page/music_page.dart';
import 'package:mobile/services/getTracks.dart';
import 'package:mobile/themes/app_assets.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:mobile/pages/feature_page/components/songs_list.dart';
import "package:mobile/configs/svg.dart";
import 'package:mobile/widgets/constain_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile/widgets/truncate_text.dart';

class SongsList extends StatefulWidget {
  @override
  State<SongsList> createState() => _SongListState();
}

class _SongListState extends State<SongsList> {
  late List tracks;

  @override
  void initState() {
    super.initState();
    fetchTracks().then((data) => {
          setState(() {
            tracks = data;
            print(tracks);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2,
      height: 300,
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var track in tracks)
                Padding(
                  padding: EdgeInsets.only(right: 32),
                  child: Card(
                    elevation: 0,
                    color: AppColor.primaryBackground,
                    child: Column(
                      children: [
                        Container(
                          width: 147,
                          height: 185,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${track['images']}"),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                playerMusicPage()),
                                      );
                                    },
                                    child: Container(
                                      width: 29,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColor.secondaryColor,
                                      ),
                                      child: ContainsIcon(
                                        path: AppSVG.play,
                                        size: 18,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                truncateText(track['name']),
                                // style: AppTextStyle.heading,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                truncateText(track["album"]["artist"]["name"]),
                                // style: AppTextStyle.artistName,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
