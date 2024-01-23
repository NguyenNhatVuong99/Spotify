import 'dart:math' as math;

import 'package:flutter/material.dart';

class SearchCategoryCard extends StatelessWidget {
  const SearchCategoryCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              right: -15,
              bottom: -5,
              child: Transform.rotate(
                angle: math.pi / 8,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: NetworkImage(imageUrl))),
                  height: 70,
                  width: 70,
                  //child: Image.network(imageUrl),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
