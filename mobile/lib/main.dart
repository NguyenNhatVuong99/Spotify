import 'package:flutter/material.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/themes/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          background: AppColor
              .blackBackground1Color, // Set your desired background color here
        ),
      ),
      routerConfig: router,
    );
  }
}
