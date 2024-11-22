import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UiHelper.customText(txt: "Profile Screen",fontSize: 20),
      ),
    );
  }
}
