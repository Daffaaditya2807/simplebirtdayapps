import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greetingbirthdayforyou/model/ultah.dart';
import 'package:greetingbirthdayforyou/pages/about.dart';
import 'package:greetingbirthdayforyou/pages/bottombar.dart';
import 'package:greetingbirthdayforyou/pages/dashboard.dart';
import 'package:greetingbirthdayforyou/pages/introawal.dart';
import 'package:greetingbirthdayforyou/pages/login.dart';
import 'package:greetingbirthdayforyou/pages/newdashboard.dart';
import 'package:greetingbirthdayforyou/pages/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ChangeNotifierProvider(
      create: (context) => BirthdayModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        // home: BottomBar(),
        initialRoute: "/splashScreen",
        routes: {
          "/dashboard": (context) => Dashboard(),
          '/barbawah': (context) => BottomBar(),
          "/newdashboard": (context) => DashboardNew(),
          "/tentang": (context) => Aboutme(),
          "/splashScreen": (context) => SplashScreen(),
          "/introawal": (context) => IntroAwal(),
          "/login": (context) => Login()
        },
      ),
    );
  }
}
