import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppStyles{
  static final MaterialColor _primaryColor = MaterialColor(const Color.fromARGB(255, 165, 214, 35).value, const {});
  static const Color _btnFontColor = const Color.fromARGB(255, 61, 68, 79);
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 165, 214, 35),
    secondaryHeaderColor: const Color.fromARGB(255, 4, 90, 161),
    indicatorColor: const Color.fromARGB(255, 4, 90, 161),
    unselectedWidgetColor: Colors.white,
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
          return _primaryColor;
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          return const TextStyle(color: _btnFontColor, 
          fontWeight: FontWeight.bold,
          fontSize: 18);
        })
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 1.0), 
        borderRadius: BorderRadius.circular(10)
        ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
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