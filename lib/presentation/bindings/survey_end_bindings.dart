import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/survey_end_controller.dart';

class SurveyEndBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyEndController());
  }

}