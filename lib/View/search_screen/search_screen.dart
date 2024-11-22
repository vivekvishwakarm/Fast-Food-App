import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UiHelper.customText(txt: "Restaurant",fontSize: 20),
      ),
    );
  }
}
