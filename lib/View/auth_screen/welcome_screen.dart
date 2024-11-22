
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../ui_helper/ui_helper.dart';
import 'login/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Image-11.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    lightGrey.withOpacity(0.8),
                    lightGrey.withOpacity(0.8),
                    lightGrey.withOpacity(0.8),
                    lightYellow.withOpacity(0.6),
                    secondaryColor,
                    secondaryColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Welcome To ',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Fast Food',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  UiHelper.customText(
                    txt:
                        'Get your favourite meals delivered quickly right to your doorstep',
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  //Start with Email
                  UiHelper.create(
                      context: context,
                      text: 'Start with email',
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );},
                      width: width,
                      height: height*0.06,
                      backgroundColor: Colors.black),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  //Custom Sign in with
                  UiHelper.customSignInWith(
                    width: width * 0.3,
                    height: height * 0.002,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  //Sign with Google
                  UiHelper.customWithGoFac(
                    width: width,
                    height: height,
                    callBack: () {},
                    img: 'icons-google',
                    txt: 'Google',
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  //Sign with FaceBook
                  UiHelper.customWithGoFac(
                    width: width,
                    height: height,
                    callBack: () {},
                    img: 'facebook-logo',
                    txt: 'Facebook',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.customText(
                        txt: 'Already have an account?',
                        fontSize: 16,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      UiHelper.customTextButton(
                        text: 'Sign In',
                        color: white,
                        callBack: (){}
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
