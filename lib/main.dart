import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/presentation/backgroud.dart';
import 'package:survey_frontend/presentation/app_styles.dart';
import 'package:survey_frontend/presentation/bindings/home_bindings.dart';
import 'package:survey_frontend/presentation/bindings/initial_bindings.dart';
import 'package:survey_frontend/presentation/bindings/initial_survey_bindings.dart';
import 'package:survey_frontend/presentation/bindings/loading_bindings.dart';
import 'package:survey_frontend/presentation/bindings/login_bindings.dart';
import 'package:survey_frontend/presentation/bindings/sensors_bindings.dart';
import 'package:survey_frontend/presentation/bindings/settings_bindings.dart';
import 'package:survey_frontend/presentation/bindings/survey_end_bindings.dart';
import 'package:survey_frontend/presentation/bindings/survey_start_bindings.dart';
import 'package:survey_frontend/presentation/bindings/welcome_screen_bindings.dart';
import 'package:survey_frontend/presentation/screens/home/home_screen.dart';
import 'package:survey_frontend/presentation/screens/initial_survey/initial_survey_screen.dart';
import 'package:survey_frontend/presentation/screens/loading_screen.dart';
import 'package:survey_frontend/presentation/screens/login_screen.dart';
import 'package:survey_frontend/presentation/screens/sensors_screen.dart';
import 'package:survey_frontend/presentation/screens/settings/settings_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_end_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_start_screen.dart';
import 'package:survey_frontend/presentation/screens/welcome_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_frontend/presentation/static/routes.dart';
import 'package:workmanager/workmanager.dart';

class StaticVariables {
  static String lang = 'en';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prepareWorkManager();
  await GetStorage.init();
  StaticVariables.lang = await _getCurrentLocale();
  runApp(GetMaterialApp(
    title: 'UrbEaT',
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: Locale(StaticVariables.lang, ''),
    initialBinding: InitialBindings(),
    theme: AppStyles.lightTheme,
    initialRoute: '/loading',
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
        name: '/surveystart',
        page: () => SurveyStartScreen(),
        binding: SurveyStartBindings(),
      ),
      GetPage(
        name: Routes.welcome,
        page: () => const WelcomeScreen(),
        binding: WelcomeScreenBindings()
        ),
      GetPage(
        name: '/submitSurvey', 
        page: () => const SurveyEndScreen(),
        binding: SurveyEndBindings() 
        )
        ,
      GetPage(
        name: '/loading', 
        page: () => const LoadingScreen(),
        binding: LoadingBindings() 
        ),
      GetPage(
        name: Routes.initialSurveyQuestions, 
        page: () => InitialSurveyScreen(),
        binding: InitialSurveyBindings()
        ),
      GetPage(
          name: Routes.sensors,
          page: () => const SensorsScreen(),
          binding: SensorsBindings()
        ),
      GetPage(
         name: Routes.settings,
         page: () => const SettingsScreen(),
         binding: SettingsBindings()
        )
    ],
  ));
}

Future<String> _getCurrentLocale() async {
  final fullLocale = await Devicelocale.currentLocale;
  var locale = fullLocale!.split('-')[0];
  List<String> supportedLocalesCodes = AppLocalizations.supportedLocales
      .map((locale) => locale.languageCode)
      .toList();
  if (!supportedLocalesCodes.contains(locale)) {
    locale = 'en';
  }
  return locale;
}

Future<void> prepareWorkManager() async{
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false
  );

  await Workmanager().registerPeriodicTask(
    BackgroundTasks.sensorsDataId,
    BackgroundTasks.sensorsData,
    frequency: const Duration(minutes: 20),
    inputData: {}
  );
}