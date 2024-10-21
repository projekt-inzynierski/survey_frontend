import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/domain/models/initial_survey_response.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/screens/initial_survey/initial_survey_screen.dart';
import 'package:survey_frontend/presentation/static/routes.dart';

class WelcomeScreenController extends ControllerBase {
  late RxList<InitialSurveyQuestion> questions;
  late Map<String, InitialSurveyQuestionResponse> responsesIdMappings;

  void letsGo() async{
    Get.offAllNamed(Routes.initialSurveyQuestions, arguments: {
      "questions": questions,
      "responsesIdMappings": responsesIdMappings,
      "questionIndexFrom": 0,
      "questionIndexTo": questions.length < 5 ? questions.length - 1 : 4
    });
  }
  
  void loadGetArguments() {
    questions = Get.arguments['questions'];
    responsesIdMappings = Get.arguments['responsesIdMappings'];
  }
}