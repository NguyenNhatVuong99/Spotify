import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: screenHeight / 40.92,
          letterSpacing: -0.4),
    );
  }
}
