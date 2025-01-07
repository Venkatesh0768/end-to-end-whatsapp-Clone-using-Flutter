import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromARGB(255, 3, 255, 137), // Light blue
  scaffoldBackgroundColor: Color(0xFF141414), // Dark gray
  cardColor: Color(0xFF141414), // Slightly lighter dark gray
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF141414), // Very dark gray
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black, backgroundColor: Color(0xFF89d9f2), // Text color on button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),


  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF141414), // Card color
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.white54),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFF89d9f2), // Light blue
    ),
  ),

);
