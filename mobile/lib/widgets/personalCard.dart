// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({
    Key? key,
    this.description,
    this.title,
    required this.imageUrl,
  }) : super(key: key);
  final String? description;
  final String? title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl))),
          ),
          title != null
              ? Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.005,
                      right: screenWidth * 0.02,
                      top: screenHeight * 0.01),
                  child: Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: screenHeight / 64.92,
                        letterSpacing: 0),
                  ),
                )
              : const SizedBox(),
          description != null
              ? Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.005,
                      right: screenWidth * 0.03,
                      top: screenHeight * 0.005),
                  child: Text(description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w300,
                          fontSize: screenHeight / 66.92,
                          letterSpacing: -0.1)),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
