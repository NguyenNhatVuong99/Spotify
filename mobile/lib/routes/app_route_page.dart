import 'package:flutter/widgets.dart';
import 'package:mobile/pages/auth/auth_page.dart';
import 'package:mobile/pages/auth/sign_in_page.dart';
import 'package:mobile/pages/auth/sign_up_page.dart';
// import 'package:mobile/pages/favorite_page/favorite_page.dart';
import 'package:mobile/pages/home_page/home_page.dart';
// import 'package:mobile/pages/home/lyrics_page.dart';
import 'package:mobile/pages/music_page/music_page.dart';
import 'package:mobile/pages/start/choose_mode_page.dart';
import 'package:mobile/pages/start/get_start_page.dart';
import 'package:mobile/pages/start/loading_page.dart';
import 'package:mobile/routes/app_route_name.dart';

class AppRoutePage {
  final String route;
  final Widget page;

  const AppRoutePage(this.route, this.page);
}

final List<AppRoutePage> routePage = [
  const AppRoutePage(AppRouteName.loadingRoute, LoadingPage()),
  const AppRoutePage(AppRouteName.getStartRoute, GetStartPage()),
  const AppRoutePage(AppRouteName.chooseModeRoute, ChooseModePage()),
  const AppRoutePage(AppRouteName.authRoute, AuthPage()),
  const AppRoutePage(AppRouteName.signInRoute, SignInPage()),
  const AppRoutePage(AppRouteName.signUpRoute, SignUpPage()),
  const AppRoutePage(AppRouteName.homeRoute, HomePage()),
  // const AppRoutePage(AppRouteName.lyricsRoute, LyricsPage()),
  AppRoutePage(AppRouteName.musicRoute, playerMusicPage()),
  // const AppRoutePage(AppRouteName.articsRoute, ArticsPage()),
];
