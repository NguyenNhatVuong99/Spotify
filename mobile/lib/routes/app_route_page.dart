import 'package:flutter/widgets.dart';
import 'package:flutter_spotify/screens/auth/auth_page.dart';
import 'package:flutter_spotify/screens/auth/sign_in_page.dart';
import 'package:flutter_spotify/screens/auth/sign_up_page.dart';
import 'package:flutter_spotify/screens/start/get_start_page.dart';
import 'package:flutter_spotify/screens/start/loading_page.dart';
import 'package:flutter_spotify/screens/home/base.dart';


import 'app_route_name.dart';

class AppRoutePage {
  final String route;
  final Widget page;

  const AppRoutePage(this.route, this.page);
}

final List<AppRoutePage> routePage = [
  const AppRoutePage(AppRouteName.authRoute, AuthPage()),
  const AppRoutePage(AppRouteName.signInRoute, SignInPage()),
  const AppRoutePage(AppRouteName.authRoute, AuthPage()),
  const AppRoutePage(AppRouteName.getStartRoute, GetStartPage()),
  const AppRoutePage(AppRouteName.signUpRoute, SignUpPage()),
  const AppRoutePage(AppRouteName.loadingRoute, LoadingPage()),
  const AppRoutePage(AppRouteName.homeRoute, Base()),
];
