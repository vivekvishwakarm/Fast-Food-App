import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';

class UiHelper {
  //Custom TextButton for login signIn
  static customTextButton({
    required String text,
    Color? color,
    VoidCallback? callBack,
  }) {
    return TextButton(
      onPressed: () {
        callBack!();
      },
      child: Text(
        text,
        style: TextStyle(
          color: color ?? secondaryColor,
          fontSize: 16,
        ),
      ),
    );
  }

//Custom Button for login signIn start with email
  static ElevatedButton create({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    double fontSize = 19,
    Color textColor = Colors.white,
    required double width,
    required double height,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor ?? secondaryColor,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: textColor),
      ),
    );
  }

  static customText(
      {required String txt,
      Color? color,
      double? fontSize,
      FontWeight? fontWeight}) {
    return Text(
      txt,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }

  //Sign In with
  static customSignInWith({required double width, required double height}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.black54,
          ),
        ),
        UiHelper.customText(
          txt: 'Sign in with',
          fontSize: 16,
        ),
        Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

//Custom Sign In with Google Facebook
  static customWithGoFac({
    required double width,
    required double height,
    Color? color,
    String? img,
    VoidCallback? callBack,
    required String txt,
  }) {
    return SizedBox(
      width: width,
      height: height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height * 0.06),
          backgroundColor: color ?? white,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/$img.svg",
              width: 23,
              height: 23,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Sign in with $txt",
              style: const TextStyle(
                fontSize: 19,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //OutlineSignWithFaGo
  static outlinedButton({
    String? text,
    VoidCallback? onPressed,
    double fontSize = 19,
    required double width,
    required double height,
    String? img,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(width, height),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/$img.svg",
              width: 23,
              height: 23,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text!,
              style: const TextStyle(
                fontSize: 19,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Custom TextFormField
  static customTextFormField(
      {required TextEditingController controller,
      String? labelText,
      String? Function(String?)? validator,
      required TextInputType keyboardType,
      bool? obscureText,
      IconData? suffixIcon,
      Function()? onSuffixIconTap}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: lightGrey),
      decoration: InputDecoration(
        hintText: labelText,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(suffixIcon),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: secondaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: lightGrey,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: lightGrey,
          ),
        ),
      ),
    );
  }
}
