import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/app_styles.dart';
import 'package:survey_frontend/presentation/bindings/insert_demografic_information_bindings.dart';
import 'package:survey_frontend/presentation/bindings/insert_health_status_information_bindings.dart';
import 'package:survey_frontend/presentation/bindings/insert_well_being_information_bindings.dart';
import 'package:survey_frontend/presentation/bindings/login_bindings.dart';
import 'package:survey_frontend/presentation/screens/home_screen.dart';
import 'package:survey_frontend/presentation/screens/insert_demografic_information_screen.dart';
import 'package:survey_frontend/presentation/screens/insert_health_status_information_screen.dart';
import 'package:survey_frontend/presentation/screens/insert_well_being_information_screen.dart';
import 'package:survey_frontend/presentation/screens/login_screen.dart';

void main() {
  runApp(GetMaterialApp(
    theme: AppStyles.lightTheme,
    initialRoute: '/insertdemograficinformation',
    getPages: [
      GetPage(
        name: '/login',
        page: () => const LoginScreen(),
        binding: LoginBindings()
      ),
      GetPage(
        name: '/home', 
        page: () => const HomeScreen()
      ),
      GetPage(
        name: '/insertdemograficinformation', 
        page: () => const InsertDemograficInformationDataScreen(),
        binding: InsertDemograficInformationBindings()
      ),
      GetPage(
        name: '/insertdemograficinformation/inserthealthstatusinformation', 
        page: () => const InsertHealthStatusInformationScreen(),
        binding: InsertHealthStatusInformationBindings()
      ),
      GetPage(
        name: '/insertdemograficinformation/inserthealthstatusinformation/insertwellbeinginformation', 
        page: () => const InsertWellBeingInformationScreen(),
        binding: InsertWellBeingInformationBindings()
      ),
    ],
  ));
}
