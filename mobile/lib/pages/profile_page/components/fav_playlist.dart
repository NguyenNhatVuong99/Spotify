// ignore_for_file: camel_case_types, annotate_overrides, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mobile/services/getTracks.dart';
import 'package:mobile/themes/app_assets.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';

class favoritePlayListComponents extends StatefulWidget {
  const favoritePlayListComponents({super.key});

  State<favoritePlayListComponents> createState() => _favoritePlayListState();
}

class _favoritePlayListState extends State<favoritePlayListComponents>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text(
              'Public playlists',
              style: AppTextStyle.heading,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 30,
            ),
            for (var track in tracks)
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AppAssets.Song4)),
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: const Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    child: Text(
                                      'song name',
                                      // 'hello',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.songTitle,
                                    ),
                                  ),
                                  InkWell(
                                    child: Text(
                                      'Billie Eilish',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.artistNameMin,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Container(
                                    width: 50,
                                    height: 30,
                                    child: const Text('5:33',
                                        style: AppTextStyle.time)),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_horiz,
                                          color: AppColor.activeTextColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
