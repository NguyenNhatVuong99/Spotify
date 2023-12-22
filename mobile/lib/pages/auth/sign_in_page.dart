import 'package:flutter/material.dart';
import 'package:mobile/components/app_input.dart';
import 'package:mobile/pages/auth/support_page.dart';
import 'package:mobile/rules/rules.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/themes/app_textstyle.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/configs/svg.dart';
import 'package:mobile/themes/app_color.dart';
import 'sign_up_page.dart';
import 'package:mobile/services/auth_service.dart';

// import "auth_page.dart";
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void _navigateToSupportPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Support_page()),
    );
  }

  void _navigateToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  AuthService authService = AuthService();

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
              AppSVG.logo,
              height: 33,
            ),
          ],
        ),
        leading: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                AppSVG.arrow,
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
                        validator: (value) {
                          return RulesValidator.validatorPassword(value);
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Recovery password",
                              style: AppTextStyle.instance.textLetter,
                            )),
                      ],
                    ),
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authService.singIn(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: AppTextStyle.instance.inputText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppSVG.line),
                        Text('or  '),
                        SvgPicture.asset(AppSVG.line),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(AppSVG.google),
                        SvgPicture.asset(AppSVG.apple),
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
