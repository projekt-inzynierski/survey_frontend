import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';

class SurveyQuestionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyQuestionController>(() => SurveyQuestionController());
  }
}
