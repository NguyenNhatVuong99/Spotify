import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/models/lyric.dart';

class FullScreenLyricPage extends StatefulWidget {
  final List<Lyric> lyrics;
  final Duration currentPosition;
  final Function(Duration) updatePositionCallback;

  const FullScreenLyricPage({
    Key? key,
    required this.lyrics,
    required this.currentPosition,
    required this.updatePositionCallback,
  }) : super(key: key);

  @override
  State<FullScreenLyricPage> createState() => _FullScreenLyricPageState();
}

class _FullScreenLyricPageState extends State<FullScreenLyricPage> {
  @override
  void initState() {
    super.initState();
    _updateLyrics();
  }

  @override
  void didUpdateWidget(covariant FullScreenLyricPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateLyrics();
  }

  void _updateLyrics() {
    Duration currentPosition = widget.currentPosition;

    setState(() {
      for (Lyric lyric in widget.lyrics) {
        if (currentPosition.inMilliseconds >= lyric.startTime &&
            currentPosition.inMilliseconds <= lyric.endTime) {
          lyric.isCurrent = true;
        } else {
          lyric.isCurrent = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB8102C),
        title: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Forever And One',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Halloween',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FluentIcons.more_horizontal_20_regular),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.2, 1],
            colors: [
              Color(0xFFB8102C),
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.lyrics.length,
          itemBuilder: (context, index) {
            Lyric lyric = widget.lyrics[index];
            return ListTile(
              title: Text(
                lyric.content,
                style: TextStyle(
                  fontSize: 24,
                  color: lyric.isCurrent ? Colors.red : Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
