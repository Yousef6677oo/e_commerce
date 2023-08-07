import 'package:flutter/material.dart';

import '../sign_in/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacementNamed(context, SignInScreen.routeName));
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash_screen.png"),
              fit: BoxFit.cover)),
    );
  }
}
