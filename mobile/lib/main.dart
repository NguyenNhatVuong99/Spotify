import 'package:flutter/material.dart';
import 'package:flutter_spotify/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
          fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
