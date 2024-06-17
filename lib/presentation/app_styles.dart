import 'package:flutter/material.dart';

class AppStyles{
  static final MaterialColor _primaryColor =
      MaterialColor(const Color.fromRGBO(165, 214, 35, 0.46).value, const {});
  static const Color _btnFontColor = Color.fromARGB(255, 68, 99, 55);
  static const Color _appNameColor = Color.fromARGB(255, 61, 68, 79);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color.fromARGB(255, 165, 214, 35),
      primaryColorLight: const Color.fromARGB(117, 166, 214, 35),
      primaryColorDark: const Color.fromARGB(255, 117, 161, 0),
      cardColor: const Color.fromARGB(255, 252, 176, 64),
    indicatorColor: const Color.fromARGB(255, 4, 90, 161),
      hintColor: const Color.fromARGB(255, 230, 166, 72),
      highlightColor: const Color(0xFFCE7B00),
    unselectedWidgetColor: Colors.white,
    fontFamily: 'Roboto',
      shadowColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20
      )
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(
        color: _appNameColor,
        fontSize: 25,
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          return _primaryColor;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return _appNameColor; // Text color
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          return const TextStyle(
              color: _appNameColor, 
          fontWeight: FontWeight.bold,
          fontSize: 18);
        }),
        elevation: MaterialStateProperty.resolveWith((states) {
          return 0;
        }),
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
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle( 
        backgroundColor: MaterialStateProperty.resolveWith((states){
          return Colors.white;
        })
      ))
  );
}