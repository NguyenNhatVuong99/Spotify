// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/app_route_name.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/themes/app_textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _authService = new AuthService();
  void _logout() async {
    bool result = await _authService.logout();
    final goRouter = GoRouter.of(context);
    if (result) {
      goRouter.go(AppRouteName.loadingRoute);
      await Future.delayed(const Duration(seconds: 2));
      goRouter.go(AppRouteName.authRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: _logout,
          child: Text(
            "Forgot Password",
            style: AppTextStyle.instance.textLetter,
          )),
    );
  }
}
