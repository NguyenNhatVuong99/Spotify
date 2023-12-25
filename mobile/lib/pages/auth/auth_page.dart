import 'package:flutter/material.dart';
import 'package:mobile/themes/app_color.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'package:mobile/themes/app_textstyle.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/configs/constant_svg.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void _navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  void _navigateToSignInPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grayMediumBackgroundColor,
        leading: IconButton(
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
      ),
      body: Container(
        color: AppColor.grayMediumBackgroundColor,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/png/person.png',
                )),
            SizedBox(
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ConstantSvg.logo),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Enjoy listening to music',
                    style: AppTextStyle.instance.authTitle,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider ',
                      style: AppTextStyle.instance.textLetter,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 73,
                        width: 147,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(66, 200, 60, 1),
                            borderRadius: BorderRadius.circular(99)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(99),
                              ),
                            ),
                          ),
                          onPressed: _navigateToRegisterPage,
                          child: Text(
                            'Register',
                            style: AppTextStyle.instance.textButton,
                          ),
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 73,
                        width: 147,
                        child: FilledButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(99),
                              ),
                            ),
                          ),
                          onPressed: _navigateToSignInPage,
                          child: Text(
                            'Sign in',
                            style: AppTextStyle.instance.textButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
