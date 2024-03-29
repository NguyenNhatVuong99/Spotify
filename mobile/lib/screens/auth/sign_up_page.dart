import 'package:flutter/material.dart';
import 'package:flutter_spotify/components/app_input.dart';
import 'package:flutter_spotify/configs/constant_svg.dart';
import 'package:flutter_spotify/rules/rules.dart';
import 'package:flutter_spotify/services/auth_service.dart';
import 'package:flutter_spotify/themes/app_color.dart';
import 'package:flutter_spotify/themes/app_textstyle.dart';
import 'package:flutter_svg/svg.dart';

import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void _navigateToSignInPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // bool _isPasswordVisible = false;
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
                      'Register',
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
                          onPressed: () {},
                          child: Text(
                            "Click Here",
                            style: AppTextStyle.instance.smallTextColor,
                          ),
                        ),
                      ],
                    ),
                    AppInput(
                      label: 'Enter Name',
                      controller: _fullNameController,
                      validator: (value) {
                        return RulesValidator.validatorName(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppInput(
                      label: 'Enter Email',
                      controller: _emailController,
                      validator: (value) {
                        return RulesValidator.validatorEmail(value);
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
                          return RulesValidator.validatorPasswordSignUp(value);
                        }),
                    const SizedBox(
                      height: 20,
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
                            
                          }
                        },
                        child: Text(
                          "Creat Account",
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
                          'Do you have any account ?',
                          style: AppTextStyle.instance.textFooter,
                        ),
                        TextButton(
                          onPressed: _navigateToSignInPage,
                          child: Text(
                            "Sign In",
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
