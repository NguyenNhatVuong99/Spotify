import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomLibraryListTile extends StatelessWidget {
  const CustomLibraryListTile({
    Key? key,
    this.description,
    this.title,
    required this.imageUrl,
    this.isPinned,
    this.type,
    this.artist,
  }) : super(key: key);
  final String? description;
  final String? title;
  final String imageUrl;
  final bool? isPinned;
  final String? type;
  final String? artist;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return type == 'Artist'
        ? artistLayout(screenWidth, screenHeight, type!, imageUrl, title!)
        : type == 'Playlist' || type == 'Liked'
            ? playlistLayout(screenWidth, screenHeight, type!, imageUrl, title!,
                isPinned == null ? false : true)
            : albumLayout(screenWidth, screenHeight, type!, imageUrl, title!,
                isPinned == null ? false : true, artist == null ? '' : artist!);
  }
}

Widget artistLayout(double screenWidth, double screenHeight, String type,
    String imageUrl, String title) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage(imageUrl),
      radius: 26,
    ),
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: screenHeight / 64.92,
          letterSpacing: 0),
    ),
    subtitle: Text(
      type,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.white60,
          fontWeight: FontWeight.w300,
          fontSize: screenHeight / 66.92,
          letterSpacing: 0),
    ),
  );
}

Widget playlistLayout(double screenWidth, double screenHeight, String type,
    String imageUrl, String title, bool isPinned) {
  return ListTile(
    leading: AspectRatio(
      aspectRatio: 1 / 1,
      child: Image.network(imageUrl),
    ),
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: screenHeight / 40,
          letterSpacing: 0),
    ),
    subtitle: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isPinned
            ? Row(
                children: [
                  const Icon(
                    FluentIcons.pin_12_filled,
                    size: 14,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                ],
              )
            : const SizedBox(),
        Text(
          type == 'Liked' ? 'Playlist' : type,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w300,
              fontSize: screenHeight / 66.92,
              letterSpacing: 0),
        ),
      ],
    ),
  );
}

Widget albumLayout(double screenWidth, double screenHeight, String type,
    String imageUrl, String title, bool isPinned, String artist) {
  return ListTile(
    leading: AspectRatio(
      aspectRatio: 1 / 1,
      child: Image.network(imageUrl),
    ),
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: screenHeight / 64.92,
          letterSpacing: 0),
    ),
    subtitle: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isPinned
            ? Row(
                children: [
                  const Icon(
                    FluentIcons.pin_12_filled,
                    size: 14,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                ],
              )
            : const SizedBox(),
        Text(
          '$type・$artist',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w300,
              fontSize: screenHeight / 66.92,
              letterSpacing: 0),
        ),
      ],
    ),
  );
}
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       AspectRatio(
//         aspectRatio: 1 / 1,
//         child: Image.network(imageUrl),
//       ),
//       Padding(
//         padding: EdgeInsets.only(
//           top: screenHeight * 0.01,
//           left: screenWidth * 0.006,
//           right: screenWidth * 0.02,
//         ),
//         child: Text(
//           title,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w400,
//               fontSize: screenHeight / 64.92,
//               letterSpacing: 0),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.only(
//           top: screenHeight * 0.005,
//           left: screenWidth * 0.006,
//           right: screenWidth * 0.02,
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             isPinned
//                 ? Row(
//                     children: [
//                       const Icon(
//                         FluentIcons.pin_12_filled,
//                         size: 14,
//                         color: Colors.greenAccent,
//                       ),
//                       SizedBox(
//                         width: screenWidth * 0.01,
//                       ),
//                     ],
//                   )
//                 : const SizedBox(),
//             Text(
//               '$type・$artist',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                   color: Colors.white60,
//                   fontWeight: FontWeight.w300,
//                   fontSize: screenHeight / 66.92,
//                   letterSpacing: 0),
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }
