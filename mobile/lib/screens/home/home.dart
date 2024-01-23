import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_spotify/data/data.dart';
import 'package:flutter_spotify/screens/home/album.dart';
import 'package:flutter_spotify/screens/home/playlist.dart';
import 'package:flutter_spotify/screens/home/settings.dart';

import 'package:flutter_spotify/utils/timeRange.dart';
import 'package:flutter_spotify/widgets/personalCard.dart';
import 'package:flutter_spotify/widgets/recommendCard.dart';
import 'package:flutter_spotify/widgets/title.dart';

import 'liked.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: const Color.fromARGB(255, 22, 22, 22),
          elevation: 0,
          centerTitle: false,
          //toolbarHeight: screenHeight * 0.11,
          title: Text(
            TimeRange().checkRange(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          pinned: true,
          floating: true,
          snap: true,
          actions: [
            Bounceable(
                curve: Curves.bounceOut,
                reverseCurve: Curves.bounceIn,
                onTap: () {},
                child: const Icon(FluentIcons.alert_20_regular)),
            SizedBox(
              width: screenWidth * 0.055,
            ),
            Bounceable(
                curve: Curves.bounceOut,
                reverseCurve: Curves.bounceIn,
                onTap: () {},
                child: const Icon(FluentIcons.history_20_regular)),
            SizedBox(
              width: screenWidth * 0.055,
            ),
            Bounceable(
                curve: Curves.bounceOut,
                reverseCurve: Curves.bounceIn,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ));
                },
                child: const Icon(FluentIcons.settings_20_regular)),
            SizedBox(
              width: screenWidth * 0.03,
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(screenWidth, screenHeight * 0.06),
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.035),
              child: Row(
                children: [
                  Bounceable(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: Colors.black12,
                      label: const Text('Music'),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight / 64.92),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  Bounceable(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: Colors.black12,
                      label: const Text('Podcasts & Shows'),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight / 64.92),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Made for Jerin'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: screenHeight * 0.4,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = popularAlbums[index];
                    return Bounceable(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Album(data: data),
                            ));
                      },
                      child: RecommendCard(
                          description: popularAlbums[index]['artist'],
                          name: popularAlbums[index]['title'],
                          imageUrl: popularAlbums[index]['imageUrl']),
                    );
                  },
                  itemCount: popularAlbums.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.040, right: screenWidth * 0.040),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Recently played'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: screenHeight * 0.4,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = recentlyPlayed[index];

                    return Bounceable(
                      onTap: () {
                        if (data['type'] == 'Playlist') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Playlist(data: data),
                              ));
                        } else if (data['type'] == 'Liked') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Liked(
                                  data: data,
                                ),
                              ));
                        } else if (data['type'] == 'Album' ||
                            data['type'] == 'Single') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Album(
                                  data: data,
                                ),
                              ));
                        }
                      },
                      child: PersonalCard(
                          title: recentlyPlayed[index]['title'],
                          imageUrl: recentlyPlayed[index]['imageUrl']),
                    );
                  },
                  itemCount: recentlyPlayed.length,
                  // separatorBuilder: (context, index) {
                  //   return SizedBox(width: screenWidth*0.02,);
                  // },
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.040, right: screenWidth * 0.040),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Made For Us'),
            ),
            
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Charts'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: screenHeight * 0.4,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = charts[index];
                    return Bounceable(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Playlist(data: data),
                            ));
                      },
                      child: RecommendCard(
                          description: charts[index]['description'],
                          imageUrl: charts[index]['imageUrl']),
                    );
                  },
                  itemCount: charts.length,
                  // separatorBuilder: (context, index) {
                  //   return SizedBox(width: screenWidth*0.02,);
                  // },
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.040, right: screenWidth * 0.040),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Mood'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: screenHeight * 0.4,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = moods[index];
                    return Bounceable(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Playlist(data: data),
                            ));
                      },
                      child: RecommendCard(
                          description: moods[index]['description'],
                          imageUrl: moods[index]['imageUrl']),
                    );
                  },
                  itemCount: moods.length,
                  // separatorBuilder: (context, index) {
                  //   return SizedBox(width: screenWidth*0.02,);
                  // },
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.040, right: screenWidth * 0.040),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'New releases for you'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: screenHeight * 0.28,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = newReleases[index];
                    return Bounceable(
                      onTap: () {
                        if (data['type'] == 'Playlist') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Playlist(data: data),
                              ));
                        } else if (data['type'] == 'Album' ||
                            data['type'] == 'Single') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Album(
                                  data: data,
                                ),
                              ));
                        }
                      },
                      child: PersonalCard(
                          title: newReleases[index]['title'],
                          description: newReleases[index]['description'],
                          imageUrl: newReleases[index]['imageUrl']),
                    );
                  },
                  itemCount: newReleases.length,
                  // separatorBuilder: (context, index) {
                  //   return SizedBox(width: screenWidth*0.02,);
                  // },
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.040, right: screenWidth * 0.040),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.2,
            )
          ]),
        )
      ],
    );
  }
}
