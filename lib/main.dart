
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practiceapp/models/my_cart.dart';
import 'package:practiceapp/pages/home_detail_page.dart';
import 'package:practiceapp/pages/home_page.dart';
import 'package:practiceapp/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practiceapp/utils/routes.dart';
import 'package:practiceapp/widgets/theme.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      theme: MyTheme.lightTheme,
      darkTheme: ThemeData(
        brightness: Brightness.light,
        fontFamily:GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute:  MyRoutes.loginRoute,
      routes: {
        "/":(context)=> const LoginPage(),
        MyRoutes.homeRoute:(context)=> const HomePage(),
        MyRoutes.loginRoute:(context)=> const LoginPage(),
      },
    );
  }
}
