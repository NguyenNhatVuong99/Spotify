import 'package:flutter/material.dart';
import 'package:mobile/themes/app_color.dart';

class Support_page extends StatefulWidget {
  const Support_page({super.key});

  @override
  State<Support_page> createState() => _Support_pageState();
}

class _Support_pageState extends State<Support_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: AppColor.grayDarkBackgroundColor,
      title: const Text("Đang phát triển..."),
    ));
  }
}
