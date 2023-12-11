import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(err.toString()),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(err.toString()),
          );
        },
      );
    }
  }
}
