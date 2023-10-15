import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/pages/about.dart';
import 'package:greetingbirthdayforyou/pages/bottombar.dart';
import 'package:greetingbirthdayforyou/pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: BottomBar(),
      routes: {
        "/dashboard": (context) => Dashboard(),
        "/tentang": (context) => Aboutme()
      },
    );
  }
}
