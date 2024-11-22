
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../bottom_nave_bar/bottom_nav_bar.dart';
import '../../ui_helper/ui_helper.dart';
import '../signin/signin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              const Text('Email'),
              UiHelper.customTextFormField(
                controller: emailController,
                labelText: 'Your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text('Password'),
              UiHelper.customTextFormField(
                controller: passwordController,
                labelText: 'Password',
                keyboardType: TextInputType.number,
                suffixIcon: Icons.remove_red_eye,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UiHelper.customTextButton(text: 'Forgot password?'),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              UiHelper.create(
                context: context,
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(),
                    ),
                  );
                },
                width: width,
                height: height * 0.06,
              ),
              //Sign in with
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(
                    txt: 'Don\'t have an account?',
                    fontSize: 16,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  UiHelper.customTextButton(
                      text: 'Sign In',
                      color: secondaryColor,
                      callBack: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              // Sign In with
              UiHelper.customSignInWith(
                width: width * 0.3,
                height: height * 0.002,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              //Sign with Facebook
              UiHelper.outlinedButton(
                width: width,
                height: height * 0.06,
                onPressed: () {},
                img: 'facebook-logo',
                text: 'Sign in with Facebook',
              ),
              SizedBox(
                height: height * 0.015,
              ),
              //Sign with Google
              UiHelper.outlinedButton(
                width: width,
                height: height * 0.06,
                onPressed: () {},
                img: 'icons-google',
                text: 'Sign in with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
