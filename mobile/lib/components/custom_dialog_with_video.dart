// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:mobile/themes/app_color.dart';

class CustomDialogWithVideo extends StatefulWidget {
  final String desc;
  final String videoUrl; // Thêm đường dẫn video vào đây
  const CustomDialogWithVideo(
      {Key? key, required this.desc, required this.videoUrl})
      : super(key: key);

  @override
  _CustomDialogWithVideoState createState() => _CustomDialogWithVideoState();
}

class _CustomDialogWithVideoState extends State<CustomDialogWithVideo> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    // Initialize _controller to a placeholder
    _controller = VideoPlayerController.network(''); // Placeholder URL

    // Start loading the video
    _loadVideo();
  }

  _loadVideo() async {
    try {
      FileInfo? fileInfo =
          await DefaultCacheManager().getFileFromCache(widget.videoUrl);

      if (fileInfo != null) {
        _controller = VideoPlayerController.file(fileInfo.file)
          ..initialize().then((_) {
            setState(() {});
            if (!_controller.value.isPlaying) {
              _controller.play();
            }
          })
          ..setVolume(2.0)
          ..setLooping(true);
      } else {
        _controller = VideoPlayerController.network(widget.videoUrl)
          ..initialize().then((_) {
            if (!_controller.value.isPlaying) {
              _controller.play();
            }
            // Download and cache the video after playing
            DefaultCacheManager().downloadFile(widget.videoUrl);
          })
          ..setVolume(2.0)
          ..setLooping(true);
      }
    } catch (e) {
      print('Error loading video: $e');
      // Handle the error appropriately, e.g., show a message to the user
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: AppColor.primaryTextColor,
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            const SizedBox(height: 12),
            Text(
              widget.desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColor.blackBackground1Color,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.primaryColor)),
              onPressed: () {
                _controller.pause();
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.whiteText2Color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
