import 'package:flutter/material.dart';

class AppStyles{
  static const MaterialColor _primaryColor = Colors.green;
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.green,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20
      )
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          return Colors.green;
        })
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 1.0), 
        borderRadius: BorderRadius.circular(10)
        ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppStyles._primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ) 
    )
  );
}