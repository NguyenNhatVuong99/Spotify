import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/data/data.dart';
import 'package:flutter_spotify/screens/home/home.dart';
import 'package:flutter_spotify/screens/home/library.dart';
import 'package:flutter_spotify/screens/home/search.dart';

import 'package:flutter_spotify/widgets/nowPlaying.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentIndex = 0;

  List<Widget> mainBodies = [const Home(), const Search(), const Library()];

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool fullPlayer = false;
  bool offStage = false;

  void nowPlayingMethod() {
    setState(() {
      fullPlayer = !fullPlayer;
      offStage = !offStage;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          mainBodies[currentIndex],
          // Bottom Navigation Bar
          Offstage(
            offstage: offStage,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 400),
                height: screenHeight * 0.11,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.99),
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.3, 0.7],
                  ),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                    currentIndex: currentIndex,
                    elevation: 0,
                    enableFeedback: true,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.transparent,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white70,
                    onTap: (index) {
                      changeTab(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(FluentIcons.home_20_regular),
                          activeIcon: Icon(FluentIcons.home_20_filled),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(FluentIcons.search_20_regular),
                          activeIcon: Icon(FluentIcons.search_20_filled),
                          label: 'Search'),
                      BottomNavigationBarItem(
                          icon: Icon(FluentIcons.library_20_regular),
                          activeIcon: Icon(FluentIcons.library_20_filled),
                          label: 'Your Library'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: !fullPlayer ? 80 : 0,
              left: !fullPlayer ? 10 : 0,
              right: !fullPlayer ? 10 : 0,
              child: GestureDetector(
                onTap: () {
                  nowPlayingMethod();
                },
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastOutSlowIn,
                    width: !fullPlayer ? screenWidth * 0.9 : screenWidth,
                    height: !fullPlayer ? screenHeight * 0.08 : screenHeight,
                    decoration: BoxDecoration(
                        color: Color(int.parse(nowPlaying["color"])),
                        borderRadius: fullPlayer
                            ? BorderRadius.circular(0)
                            : BorderRadius.circular(10)),
                    child: fullPlayer
                        ? Offstage(
                            offstage: !offStage,
                            child: NowPlaying(
                              closeOpen: nowPlayingMethod,
                            ))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 5,
                                        top: 8,
                                        bottom: 5),
                                    child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          nowPlaying['imageUrl'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        nowPlaying['title'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.005,
                                      ),
                                      Text(
                                        nowPlaying['artists'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(FluentIcons
                                          .device_meeting_room_remote_20_regular)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          FluentIcons.play_20_filled))
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: LinearProgressIndicator(
                                  value: 0.2,
                                  minHeight: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            ],
                          )),
              )),
        ],
      ),
    );
  }
}
