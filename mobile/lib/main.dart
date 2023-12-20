import 'package:flutter/material.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/provide_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Theme Toggle',
            theme: themeProvider.isDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
