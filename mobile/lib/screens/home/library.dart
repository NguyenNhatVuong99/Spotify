import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_spotify/data/data.dart';
import 'package:flutter_spotify/screens/home/playlist.dart';
import 'package:flutter_spotify/widgets/customLibraryCard.dart';
import 'package:flutter_spotify/widgets/customLibraryListTile.dart';

import 'album.dart';
import 'liked.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  bool isGrid = false;

  Future openBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: false,
      backgroundColor: Colors.grey[900],
      elevation: 5,
      context: context,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 5),
          children: const [
            Center(
                child: Icon(
              FluentIcons.line_horizontal_1_20_filled,
              size: 27,
              color: Colors.white24,
            )),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Center(
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                FluentIcons.music_note_2_20_regular,
                color: Colors.white54,
                size: 28,
              ),
              title: Text(
                'Playlist',
              ),
              subtitle: Text(
                'Add songs to a new playlist',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                FluentIcons.sound_wave_circle_20_regular,
                color: Colors.white54,
                size: 28,
              ),
              title: Text(
                'Blend',
              ),
              subtitle: Text(
                'Combine tastes in a shared playlist with friends',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color.fromARGB(255, 22, 22, 22),
          elevation: 5,
          centerTitle: false,
          //toolbarHeight: screenHeight * 0.11,
          forceElevated: true,
          title: const Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                    'https://scontent.fdad7-1.fna.fbcdn.net/v/t39.30808-6/312297714_206841441768622_8737112273700475545_n.jpg?_nc_cat=109&cb=99be929b-8d691acd&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=46nZhXYszPgAX_d_biY&_nc_ht=scontent.fdad7-1.fna&oh=00_AfA9QJM062zcnOa7QpwJfQldya0FStyoUewAl6cVmB20LA&oe=65B47281'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Your Library',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          pinned: true,
          actions: [
            Bounceable(
                curve: Curves.bounceOut,
                reverseCurve: Curves.bounceIn,
                onTap: () {},
                child: const Icon(FluentIcons.search_20_regular)),
            SizedBox(
              width: screenWidth * 0.055,
            ),
            Bounceable(
                curve: Curves.bounceOut,
                reverseCurve: Curves.bounceIn,
                onTap: openBottomSheet,
                child: const Icon(FluentIcons.add_20_regular)),
            SizedBox(
              width: screenWidth * 0.03,
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(screenWidth, screenHeight * 0.06),
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.035, bottom: screenHeight * 0.005),
              child: Row(
                children: [
                  Bounceable(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: Colors.black12,
                      label: const Text('Playlists'),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight / 65.92),
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
                          fontSize: screenHeight / 65.92),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  Bounceable(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: Colors.black12,
                      label: const Text('Albums'),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight / 65.92),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  Bounceable(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: Colors.black12,
                      label: const Text('Artists'),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight / 65.92),
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
            padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            FluentIcons.arrow_sort_20_regular,
                            size: 20,
                          ),
                        ),
                        Text('Alphabetical')
                      ],
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    icon: isGrid
                        ? const Icon(FluentIcons.apps_list_20_regular)
                        : const Icon(FluentIcons.grid_20_regular)),
              ],
            ),
          ),
          isGrid
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: screenHeight * 0.28,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.only(bottom: 200, left: 10, right: 10),
                  itemBuilder: (context, index) {
                    var data = library[index];
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
                      child: Center(
                        child: CustomLibraryCard(
                          imageUrl: library[index]['imageUrl'],
                          title: library[index]['title'],
                          type: library[index]['type'],
                          isPinned: library[index]['isPinned'],
                          artist: library[index]['artist'],
                        ),
                      ),
                      // child: RecentSmallCard(
                      //     imageUrl: recentSmallCards[index]['imageUrl'],
                      //     title: recentSmallCards[index]['title']),
                    );
                  },
                  itemCount: library.length,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 200,
                  ),
                  itemBuilder: (context, index) {
                    var data = library[index];
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
                      child: CustomLibraryListTile(
                        imageUrl: library[index]['imageUrl'],
                        title: library[index]['title'],
                        type: library[index]['type'],
                        isPinned: library[index]['isPinned'],
                        artist: library[index]['artist'],
                      ),
                      // child: RecentSmallCard(
                      //     imageUrl: recentSmallCards[index]['imageUrl'],
                      //     title: recentSmallCards[index]['title']),
                    );
                  },
                  itemCount: library.length,
                )
        ]))
      ],
    );
  }
}
