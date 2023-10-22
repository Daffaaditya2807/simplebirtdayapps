import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/pages/introawal.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

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
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: IntroAwal(),
              duration: Duration(milliseconds: 2000),
              reverseDuration: Duration(milliseconds: 2000),
              type: PageTransitionType.topToBottom));
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
