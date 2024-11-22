
import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UiHelper.customText(txt: "Restaurant",fontSize: 20),
      ),
    );
  }
}
