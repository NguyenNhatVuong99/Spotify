import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile/components/custom_dialog.dart';
import 'package:mobile/pages/auth/sign_in_page.dart';
import 'package:mobile/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  singIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      Response res = await post(
        Uri.parse('https://spotify-xemk.onrender.com/api/auth/login'),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 201) {
        Map<String, dynamic> responseBody = json.decode(res.body);

        String accessToken = responseBody['accessToken'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('x-auth-token', accessToken);

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (err) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: 'LOGIN FAILED',
            desc: err.toString(),
          );
        },
      );
    }
  }

  signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      Response res = await post(
        Uri.parse('https://spotify-xemk.onrender.com/api/auth/register'),
        body: jsonEncode(
          {"email": email, "password": password, "full_name": name},
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 201) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),
        );
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (err) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: 'Register FAILED',
            desc: err.toString(),
          );
        },
      );
    }
  }
}
