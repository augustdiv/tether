import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tether/authentication/auth_screen.dart';
import 'package:tether/global/constants.dart';
import 'package:tether/global/global.dart';
import 'package:tether/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  startTimer() {
    Timer(const Duration(seconds: 8), () {
      if (firebaseAuth.currentUser != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const HomePageScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AuthScreen()));
         sharedPreferences!.setString('actCode', '0');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Hero(
                   tag: 1,
                  transitionOnUserGestures: true,
                  child: appLogo),
            ),
          ),
        ],
      ),
    );
  }
}

