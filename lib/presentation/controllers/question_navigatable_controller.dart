import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/create_survey_resopnse_dto.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_question_screen.dart';

class QuestionNavigatableController extends ControllerBase{
  bool isBusy = false;
  late SurveyDto survey;
  late List<QuestionWithSection> questions;
  int questionIndex = -1;
  late CreateSurveyResponseDto responseModel;

  void navigateToNextQuestion(QuestionNavigationMode mode) async{
    if (isBusy){
      return;
    }

    try{
      isBusy = true;

      if (!_canGoFurther()){
        return;
      }

      int nextQuestionIndex = _getNextValidQuestionIndex();

      if (nextQuestionIndex == -1){
        await Get.toNamed('/submitSurvey');
        return;
      }

      final screenFactory = () => SurveyQuestionScreen();
      Map<String, dynamic> arguments = {
        'responseModel': responseModel,
        'survey': survey,
        'questionIndex': nextQuestionIndex,
        'questions': questions
      };

      if (mode == QuestionNavigationMode.top){
        await Get.to(screenFactory, arguments: arguments, preventDuplicates: false);
        return;
      }
      await Get.off(screenFactory, arguments: arguments, preventDuplicates: false);
    } finally{
      isBusy = false;
    }
  }

  int _getNextValidQuestionIndex() {
    if (questionIndex == questions.length - 1) {
      return -1;
    }

    for (int i = questionIndex + 1; i < questions.length; i++) {
      if (questions[i].sectionOK()) {
        return i;
      }
    }

    return -1;
  }

  bool _canGoFurther(){
    return true;
  }

  void readGetArguments(){
    survey = Get.arguments['survey'];
    questions = Get.arguments['questions'];
    responseModel = Get.arguments['responseModel'];
  }
}

enum QuestionNavigationMode{
  off, top
}