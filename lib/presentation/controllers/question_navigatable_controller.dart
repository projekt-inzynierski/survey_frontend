import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_question_screen.dart';

class QuestionNavigatableController extends ControllerBase{
  bool isBusy = false;
  late SurveyDto survey;

  void navigateToNextQuestion(QuestionNavigationMode mode) async{
    if (isBusy){
      return;
    }

    try{
      isBusy = true;
      final screenFactory = () => const SurveyQuestionScreen();
      Map<String, dynamic> arguments = {
        'question': null,
        'responseModel': null,
        'survey': survey
      };

      if (mode == QuestionNavigationMode.top){
        await Get.to(screenFactory, arguments: arguments);
        return;
      }
      await Get.off(screenFactory, arguments: arguments);
    } finally{
      isBusy = false;
    }
  }

  void getSurveyFromGetArgument(){
    survey = Get.arguments['survey'];
  }
}

enum QuestionNavigationMode{
  off, top
}