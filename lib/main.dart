
import 'package:flutter/material.dart';

import 'View/splash_screen.dart';

void main() async{


  runApp(const FastFood());
}

class FastFood extends StatelessWidget {
  const FastFood({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fast Food',
      debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}



