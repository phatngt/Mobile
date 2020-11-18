//References: https://viblo.asia/p/hoc-cach-hoc-flutter-sao-cho-hieu-qua-naQZRxev5vx
import 'package:flutter/material.dart';
import 'package:flutterproject/constants.dart';
import 'package:flutterproject/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABC App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
