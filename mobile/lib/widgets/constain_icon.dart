import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainsIcon extends StatelessWidget {
  final String path;
  final double size;

  const ContainsIcon({
    super.key,
    required this.path,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        path,
        width: size,
        height: size,
      ),
    );
  }
}
