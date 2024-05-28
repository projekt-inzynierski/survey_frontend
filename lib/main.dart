import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/usecases/token_validity_checker_impl.dart';
import 'package:survey_frontend/domain/models/respondent_data_dto.dart';
import 'package:survey_frontend/presentation/app_styles.dart';
import 'package:survey_frontend/presentation/bindings/home_bindings.dart';
import 'package:survey_frontend/presentation/bindings/initial_bindings.dart';
import 'package:survey_frontend/presentation/bindings/insert_demographic_information_bindings.dart';
import 'package:survey_frontend/presentation/bindings/insert_health_status_information_bindings.dart';
import 'package:survey_frontend/presentation/bindings/insert_well_being_information_bindings.dart';
import 'package:survey_frontend/presentation/bindings/login_bindings.dart';
import 'package:survey_frontend/presentation/bindings/welcome_screen_bindings.dart';
import 'package:survey_frontend/presentation/screens/home_screen.dart';
import 'package:survey_frontend/presentation/screens/insert_demographic_information_screen.dart';
import 'package:survey_frontend/presentation/screens/insert_health_status_information_screen.dart';
import 'package:survey_frontend/presentation/screens/insert_well_being_information_screen.dart';
import 'package:survey_frontend/presentation/screens/login_screen.dart';
import 'package:survey_frontend/presentation/screens/welcome_screen.dart';

void main() async {
  await GetStorage.init();
  String startScreenPath = "/home";
  runApp(GetMaterialApp(
    initialBinding: InitialBindings(),
    theme: AppStyles.lightTheme,
    initialRoute: startScreenPath,
    getPages: [
      GetPage(
        name: '/login',
        page: () => const LoginScreen(),
        binding: LoginBindings()
      ),
      GetPage(
        name: '/home', 
          page: () => const HomeScreen(),
          binding: HomeBindings()
      ),
      GetPage(
        name: '/insertdemograficinformation', 
        page: () => const InsertDemographicInformationDataScreen(),
        binding: InsertDemographicInformationBindings()
      ),
      GetPage(
        name: '/inserthealthstatusinformation', 
        page: () => const InsertHealthStatusInformationScreen(),
        binding: InsertHealthStatusInformationBindings()
      ),
      GetPage(
        name: '/insertwellbeinginformation', 
        page: () => const InsertWellBeingInformationScreen(),
        binding: InsertWellBeingInformationBindings()
      ),
      GetPage(
        name: '/welcome',
        page: () => const WelcomeScreen(),
        binding: WelcomeScreenBindings()
        )
    ],
  ));
}

String _getStartScreenPath() {
  var storage = GetStorage();
  String? savedToken = storage.read<String>("apiToken");
  if (savedToken == null){
    return '/login';
  }

  var validityChecker = TokenValidityCheckerImpl();
  if (!validityChecker.isValid(savedToken)){
    return '/login';
  }
  var respondentData = storage.read<Map<String, dynamic>>("respondentData");
  return respondentData == null ? '/welcome' : '/home';
}