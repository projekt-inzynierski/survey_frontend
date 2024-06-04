import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';

class SurveyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyController>(() => SurveyController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
