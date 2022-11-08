import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        primarySwatch: Colors.blue,
        backgroundColor: backgroundcolor,
        scaffoldBackgroundColor: backgroundcolor,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.montserrat(
            textStyle: const TextStyle(color: Colors.white),
          ),
          bodyText2: GoogleFonts.montserrat(
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      home: ScreenMainPage(),
    );
  }
}
