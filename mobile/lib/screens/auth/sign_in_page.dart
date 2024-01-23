// ignore_for_file: use_build_context_synchronously

// import "auth_page.dart";
import 'package:flutter/material.dart';
import 'package:flutter_spotify/components/app_input.dart';
import 'package:flutter_spotify/configs/constant_svg.dart';
import 'package:flutter_spotify/configs/constant_video.dart';
import 'package:flutter_spotify/routes/app_route_name.dart';
import 'package:flutter_spotify/rules/rules.dart';
import 'package:flutter_spotify/services/auth_service.dart';
import 'package:flutter_spotify/themes/app_color.dart';
import 'package:flutter_spotify/themes/app_textstyle.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'sign_up_page.dart';
import 'support_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // ignore: unused_field
  bool _isLoading = false;
  bool result = false;

  void _handleSignIn() async {
    final goRouter = GoRouter.of(context);

    setState(() {
      _isLoading = true;
    });

    // Simulating a sign-in process (replace with your actual sign-in logic)
    if (_formKey.currentState!.validate()) {
      goRouter.go(AppRouteName.loadingRoute);
      await Future.delayed(const Duration(seconds: 2));

      // Navigate to the HomePage after 2 seconds
      goRouter.go(AppRouteName.homeRoute);
    }
  }

  void _navigateToSupportPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Support_page()),
    );
  }

  void _navigateToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  void _forgotPassword() {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const CustomDialogWithVideo(
    //         desc: 'Relax and try to remember \n your password :))',
    //         videoUrl: 'assets/video/meo');
    //   },
    // );
  }

  // AuthService authService = AuthService();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grayDarkBackgroundColor,
        actions: const [
          SizedBox(
            width: 50,
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ConstantSvg.logo,
              height: 33,
            ),
          ],
        ),
        leading: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                ConstantSvg.arrow,
                // ignore: deprecated_member_use
                color: Colors.white,
                height: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.grayDarkBackgroundColor,
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.grayDarkBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Sign in',
                      style: AppTextStyle.instance.authTitle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'If you need any support',
                          style: AppTextStyle.instance.smallText,
                        ),
                        TextButton(
                          onPressed: _navigateToSupportPage,
                          child: Text(
                            "Click Here",
                            style: AppTextStyle.instance.smallTextColor,
                          ),
                        ),
                      ],
                    ),
                    AppInput(
                      label: 'Enter Email',
                      controller: _emailController,
                      defaultValue: 'nhatvuong99@gmail.com',
                      validator: (value) {
                        return RulesValidator.validatorEmail(
                            value); // Return null if the email is valid
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppInput(
                        isPassword: true,
                        label: 'Password',
                        controller: _passwordController,
                        defaultValue: 'nhatvuong99',
                        validator: (value) {
                          return RulesValidator.validatorPasswordSignIn(value);
                        }),
                    TextButton(
                        onPressed: _forgotPassword,
                        child: Text(
                          "Forgot Password",
                          style: AppTextStyle.instance.textLetter,
                        )),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColor.primaryTextColor,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(99)))),
                        onPressed: _isLoading ? null : _handleSignIn,
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white))
                            : Text(
                                'Sign In',
                                style: AppTextStyle.instance.inputText,
                              ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ConstantSvg.line),
                        const Text('or'),
                        SvgPicture.asset(ConstantSvg.line),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(ConstantSvg.google),
                        SvgPicture.asset(ConstantSvg.apple),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'not a member ?',
                          style: AppTextStyle.instance.textFooter,
                        ),
                        TextButton(
                          onPressed: _navigateToSignUpPage,
                          child: Text(
                            "Register Now",
                            style: AppTextStyle.instance.textFooterColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
