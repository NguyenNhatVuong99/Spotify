// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/configs/constant_svg.dart';
import 'package:mobile/routes/app_route_name.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/themes/app_color.dart';

void _checkTokenAndNavigate(BuildContext context) async {
  AuthService authService = AuthService();
  try {
    String token = await authService.getTokenAuth();
    final goRouter = GoRouter.of(context);

    if (token.isEmpty) {
      goRouter.go(AppRouteName.authRoute);
    } else {
      goRouter.go(AppRouteName.homeRoute);
    }
  } catch (error) {
    // Xử lý lỗi ở đây nếu cần
    print("Error occurred while checking token: $error");
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  void _navigateAfterDelay(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      if (context != null) {
        _checkTokenAndNavigate(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigateAfterDelay(context);

    return Scaffold(
      backgroundColor: AppColor.blackBackground1Color,
      body: Center(
        child: SvgPicture.asset(ConstantSvg.logo),
      ),
    );
  }
}
