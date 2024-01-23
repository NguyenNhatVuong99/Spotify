// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../components/custom_dialog.dart';
// import '../components/custom_dialog_with_video.dart';
// import '../configs/constant_video.dart';
// import '../configs/constants.dart';

// class AuthService {
//   Future<bool> singIn({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       Response res = await post(
//         Uri.parse(loginURL),
//         body: jsonEncode({"email": email, "password": password}),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (res.statusCode == 201) {
//         Map<String, dynamic> responseBody = json.decode(res.body);
//         String accessToken = responseBody['accessToken'];

//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('x-auth-token', accessToken);
//         return true;
//       } else {
//         throw jsonDecode(res.body)["message"];
//       }
//     } catch (err) {
//       // showDialog(
//       //   context: context,
//       //   builder: (context) {
//       //     return CustomDialogWithVideo(
//       //         desc: err.toString(), videoUrl: ConstantVideo.meoSad);
//       //   },
//       // );
//       // return false;
//     }
//   }

//   Future<String> getTokenAuth() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getString('x-auth-token') ?? '';
//   }

//   Future<bool> signUp({
//     required BuildContext context,
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       Response res = await post(
//         Uri.parse(registerURL),
//         body: jsonEncode(
//           {"email": email, "password": password, "full_name": name},
//         ),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       if (res.statusCode == 201) {
//         return true;
//       } else {
//         throw jsonDecode(res.body)["message"];
//       }
//     } catch (err) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return CustomDialog(
//             desc: err.toString(),
//           );
//         },
//       );
//       return false;
//     }
//   }

//   Future<bool> logout() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.remove('x-auth-token');
//     return true;
//   }
// }
