import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/question_navigatable_controller.dart';

class SurveyStartBindings extends Bindings {
  @override
  void dependencies() {
    Get.create(() => QuestionNavigatableController());
  }
}