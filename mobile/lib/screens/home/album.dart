import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  const Album({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map data;
  // print( this.data)
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
            expandedHeight: screenHeight * 0.38,
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
                      child: Text(data['title'])),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: data['colors'],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.2, 1],
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 70.0, right: 70, top: 50),
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
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 11,
                                backgroundImage:
                                    NetworkImage(data['artistAvatar']),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(data['artist']),
                              )
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Text(
                            '${data['type']}・${data['year']}',
                            style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
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
                          icon:
                              const Icon(FluentIcons.more_vertical_20_regular),
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
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var songData = data['songs'][index];
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      songData['title'],
                      style: const TextStyle(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(songData['artists'],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
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
                  ),
                );
              },
              itemCount: data['songs'].length,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data['date']}, ${data['year']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.008,
                  ),
                  if (data['type'] == 'Single')
                    Text(
                      '${data['songs'].length} song',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  if (data['type'] == 'Album')
                    Text(
                      '${data['songs'].length} songs',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(data['artistAvatar']),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(data['artist']),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    '${data['copyright']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
