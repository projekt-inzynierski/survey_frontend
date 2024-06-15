import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class SurveyEndController extends ControllerBase{
  
  void endSurvey() {
    Get.offAllNamed(
      "/home",
    );
  }
}