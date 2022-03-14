import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkul_app/Screen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KKUL',
      theme: ThemeData(
          primaryTextTheme: GoogleFonts.promptTextTheme(
            Theme.of(context)
                .primaryTextTheme, // ถ้าไม่ใส่ มันจะตั้งค่า Default ทุกอย่างตาม ThemeData.light().textTheme
          ),
          textTheme: GoogleFonts.promptTextTheme(
            Theme.of(context)
                .textTheme, // ถ้าไม่ใส่ มันจะตั้งค่า Default ทุกอย่างตาม ThemeData.light().textTheme
          ),
          scaffoldBackgroundColor: Colors.white),
      home: LoginScreen(),
    );
  }
}
