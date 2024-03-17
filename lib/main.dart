import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/app_styles.dart';
import 'package:survey_frontend/presentation/bindings/login_bindings.dart';
import 'package:survey_frontend/presentation/screens/home_screen.dart';
import 'package:survey_frontend/presentation/screens/login_screen.dart';

void main() {
  runApp(GetMaterialApp(
    theme: AppStyles.lightTheme,
    initialRoute: '/login',
    getPages: [
      GetPage(
        name: '/login',
        page: () => const LoginScreen(),
        binding: LoginBindings()
      ),
      GetPage(
        name: '/home', 
        page: () => const HomeScreen()
      )
    ],
  ));
}
