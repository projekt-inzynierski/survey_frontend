import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/initial_survey_controller.dart';

class InitialSurveyBindings extends Bindings {
  @override
  void dependencies() {
    Get.create<InitialSurveyController>(
        () => InitialSurveyController(Get.find(), Get.find(), Get.find()));
  }
}
