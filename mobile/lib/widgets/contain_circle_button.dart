import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainsCircleButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final double size;

  const ContainsCircleButton(
      {super.key,
      required this.child,
      required this.size,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Center(
          child: child,
        ));
  }
}
