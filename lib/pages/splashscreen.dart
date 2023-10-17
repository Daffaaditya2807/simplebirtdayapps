import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, "/introawal");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: LottieBuilder.asset(
          "assets/balonn.json",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
