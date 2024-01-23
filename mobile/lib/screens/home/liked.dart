import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/data/data.dart';


class Liked extends StatefulWidget {
  const Liked({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map data;

  @override
  State<Liked> createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  int count = 0;

  void setLikedSongCount() {
    for (int i = 0; i < songs.length; i++) {
      if (songs[i]['isLiked']) {
        count++;
      }
    }
  }

  @override
  void initState() {
    setLikedSongCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    double top = 0;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 22, 22, 22),
            elevation: 0,
            pinned: true,
            expandedHeight: screenHeight * 0.25,
            floating: false,
            //title: Text(data['title']),
            flexibleSpace: LayoutBuilder(
              builder: (ctx, cons) {
                top = cons.biggest.height;
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: true,
                  title: AnimatedOpacity(
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 100),
                      opacity: top < 130 ? 1 : 0.0,
                      child: Text(widget.data['title'])),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: widget.data['colors'],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.3, 1],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.data['title'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.005,
                                  ),
                                  Text(
                                    '$count songs',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.04,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 15,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent[400],
                                  shape: BoxShape.circle),
                              child: IconButton(
                                icon: const Icon(FluentIcons.play_20_filled),
                                padding: const EdgeInsets.all(15),
                                color: Colors.black,
                                iconSize: 26,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 15, bottom: 50),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var songData = widget.data['songs'][index];
                if (songData['isLiked']) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          songData['albumArt'],
                          height: 100,
                        ),
                      ),
                    ),
                    title: Text(
                      songData['name'],
                      style: const TextStyle(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(songData['artist'],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          songData['isLiked']
                              ? Icon(
                                  FluentIcons.heart_20_filled,
                                  color: Colors.greenAccent[400],
                                  size: 20,
                                )
                              : const SizedBox(),
                          IconButton(
                            icon: const Icon(
                                FluentIcons.more_vertical_20_regular),
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            iconSize: 26,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
              itemCount: songs.length,
            )
          ]))
        ],
      ),
    );
  }
}
