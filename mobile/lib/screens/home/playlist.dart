import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/data/data.dart';

class Playlist extends StatelessWidget {
  const Playlist({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map data;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    double top = 0;
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 22, 22, 22),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 22, 22, 22),
              elevation: 0,
              pinned: true,
              expandedHeight: screenHeight * 0.40,
              floating: false,
              flexibleSpace: LayoutBuilder(
                builder: (ctx, cons) {
                  top = cons.biggest.height;
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: top <= 130 ? 1.0 : 0.0,
                        child: Text(data['name'])),
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: data['colors'],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 1],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 70.0, right: 70, top: 50),
                        child: Image.network(data['imageUrl']),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['description'],
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            data['by'] == null
                                ? const Text(
                                    'Made for Jerin',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w300),
                                  )
                                : Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 11,
                                        backgroundImage:
                                            NetworkImage(data['byAvatar']),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(data['by']),
                                      )
                                    ],
                                  ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Row(
                              children: [
                                if (data['by'] != null)
                                  Text(
                                    '${data['likes']} likes・',
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w300),
                                  ),
                                Text(
                                  data['duration'],
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(FluentIcons.heart_24_regular),
                            padding: const EdgeInsets.only(left: 20),
                            iconSize: 26,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                                FluentIcons.more_vertical_20_regular),
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            iconSize: 26,
                            onPressed: () {},
                          ),
                          //const Spacer(),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 10,
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
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 15, bottom: 50),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var songData = data['songs'][index];
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
                },
                itemCount: songs.length,
              )
            ]))
          ],
        ),
      ),
    );
  }
}
