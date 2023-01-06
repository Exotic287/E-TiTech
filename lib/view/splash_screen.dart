import 'welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new WelcomeScreen(),
      image: new Image.asset(
        'assets/SpalshScreen.gif',
      ),
      backgroundColor: Colors.white,
      photoSize: 200.0,
    );
  }
}

