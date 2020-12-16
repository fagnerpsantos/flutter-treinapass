import 'package:flutter/material.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';

import 'screens/home/home_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white
          ),
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              headline1: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold
              ),
              headline2: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent
              ),
              headline3: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent
              ),
              headline4: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              )
          )
      ),
      home: HomeScreen(),
    );
  }
}
