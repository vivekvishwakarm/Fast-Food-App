import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UiHelper.customText(txt: "Favorite",fontSize: 20,),
      ),
    );
  }
}
