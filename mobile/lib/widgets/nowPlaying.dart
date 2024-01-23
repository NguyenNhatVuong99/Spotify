import 'package:audioplayers/audioplayers.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/models/lyric.dart';
import 'package:flutter_spotify/widgets/lyricPage.dart';

import '../data/data.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({
    Key? key,
    required this.closeOpen,
  }) : super(key: key);

  final VoidCallback closeOpen;

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  bool isLiked = false;
  late AudioPlayer _audioPlayer;
  Duration _duration = const Duration();
  ValueNotifier<Duration> _positionNotifier =
      ValueNotifier<Duration>(const Duration());
  bool _isPlaying = false;
  double _volume = 1.0;
  List<Lyric> lyrics = [];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      _positionNotifier.value = position;
      _updateLyrics();
    });

    _loadAudio();
    lyrics = parseLyrics(nowPlaying['lyrics']);
  }

  void _loadAudio() async {
    // print('Loading audio from: ${nowPlaying['mp3']}');
    _audioPlayer.play(UrlSource(nowPlaying['mp3']));
    lyrics = parseLyrics(nowPlaying['lyrics']);
    _playPause();
  }

  void _toggleMute() {
    setState(() {
      if (_volume > 0.0) {
        _volume = 0.0;
      } else {
        _volume = 1.0;
      }
      _audioPlayer.setVolume(_volume);
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigitMinutes}:${twoDigitSeconds}";
  }

  Duration parseDuration(String durationString) {
    List<String> parts = durationString.split(':');
    int minutes = int.parse(parts[0]);
    int seconds = int.parse(parts[1]);
    return Duration(minutes: minutes, seconds: seconds);
  }

  List<Lyric> parseLyrics(List<Map<String, String>> rawLyrics) {
    List<Lyric> parsedLyrics = [];

    for (var rawLyric in rawLyrics) {
      Lyric lyric = Lyric(
        startTime: parseDuration(rawLyric['start']!).inMilliseconds,
        endTime: parseDuration(rawLyric['end']!).inMilliseconds,
        content: rawLyric['content'] ?? '',
      );
      parsedLyrics.add(lyric);
    }
    return parsedLyrics;
  }

  void _playPause() {
    // print('Play/Pause button pressed');
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      // print('Playing audio from: ${nowPlaying['mp3']}');
      _audioPlayer.play(UrlSource(nowPlaying['mp3']));
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _showLyricFullScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenLyricPage(
          lyrics: lyrics,
          currentPosition: _positionNotifier.value,
          updatePositionCallback: (newPosition) {
            _positionNotifier.value = newPosition;
          },
        ),
      ),
    );
  }

  void _updateLyrics() {
    Duration currentPosition = _positionNotifier.value;

    setState(() {
      for (Lyric lyric in lyrics) {
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
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(stops: const [
        0.2,
        1
      ], colors: [
        Colors.black.withOpacity(0.00001),
        nowPlaying["playerColor2"],
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              widget.closeOpen();
            },
            icon: const Icon(FluentIcons.chevron_down_20_regular),
          ),
          title: Text(
            nowPlaying['album'],
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FluentIcons.more_horizontal_20_regular))
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(nowPlaying['imageUrl']),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 20),
                        child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              nowPlaying["title"],
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            subtitle: Text(
                              nowPlaying["artists"],
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white60),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                              icon: isLiked
                                  ? const Icon(
                                      FluentIcons.heart_20_filled,
                                      color: Colors.white,
                                    )
                                  : const Icon(FluentIcons.heart_20_regular),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Slider(
                          value:
                              _positionNotifier.value.inMilliseconds.toDouble(),
                          min: _duration.inMilliseconds.toDouble() -
                              _duration.inMilliseconds.toDouble(),
                          max: _duration.inMilliseconds.toDouble(),
                          activeColor: Colors.white,
                          inactiveColor: Colors.white30,
                          onChanged: (double value) {
                            _audioPlayer
                                .seek(Duration(milliseconds: value.toInt()));
                          }),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  _formatDuration(_positionNotifier.value),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white54),
                                ),
                              ),
                              Text(
                                _formatDuration(
                                    parseDuration(nowPlaying['end'])),
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white54),
                              )
                            ],
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      FluentIcons.arrow_shuffle_20_regular)),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(FluentIcons.previous_20_filled),
                                iconSize: 28,
                              ),
                              IconButton(
                                onPressed: () {
                                  _playPause();
                                },
                                icon: _isPlaying
                                    ? const Icon(
                                        FluentIcons.pause_circle_20_filled)
                                    : const Icon(
                                        FluentIcons.play_circle_20_filled),
                                iconSize: 70,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(FluentIcons.next_20_filled),
                                iconSize: 28,
                              ),
                              IconButton(
                                onPressed: _toggleMute,
                                icon: _volume == 1.0
                                    ? const Icon(
                                        FluentIcons.speaker_2_20_regular)
                                    : const Icon(
                                        FluentIcons.speaker_mute_20_regular),
                              ),
                            ],
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FluentIcons
                                      .device_meeting_room_remote_20_regular)),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  _showLyricFullScreen(context);
                                },
                                icon: const Icon(
                                    FluentIcons.share_ios_20_regular),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(FluentIcons.list_20_regular),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
