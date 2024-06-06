import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/survey_service_impl.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';

class SurveyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyService>(() => SurveyServiceImpl(Get.find()));
    Get.lazyPut<SurveyController>(() => SurveyController(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
