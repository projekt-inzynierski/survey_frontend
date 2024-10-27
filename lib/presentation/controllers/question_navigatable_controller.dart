import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/create_survey_response_dto.dart';
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
  late List<String?> groupsIds;
  late Map<int, int> triggerableSectionActivationsCounts;

  void navigateToNextQuestion(QuestionNavigationMode mode) async{
    if (isBusy){
      return;
    }

    try{
      isBusy = true;

      if (!canGoFurther()){
        return;
      }

      int nextQuestionIndex = _getNextValidQuestionIndex();

      if (nextQuestionIndex == -1){
        await Get.toNamed('/submitSurvey', arguments:{
          'responseModel': responseModel
        });
        return;
      }

      screenFactory() => SurveyQuestionScreen();
      Map<String, dynamic> arguments = {
        'responseModel': responseModel,
        'survey': survey,
        'questionIndex': nextQuestionIndex,
        'questions': questions,
        "groups": groupsIds,
        "triggerableSectionActivationsCounts": triggerableSectionActivationsCounts
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
      if (questions[i].canQuestionBeShown(groupsIds, triggerableSectionActivationsCounts)) {
        return i;
      }
      //TODO: extend the cleanup when more question types are added
      responseModel.answers[i].numericAnswer = null;
      if (responseModel.answers[i].selectedOptions != null){
        responseModel.answers[i].selectedOptions![0].optionId = null;
      }
      responseModel.answers[i].yesNoAnswer = null;
    }

    return -1;
  }

  bool canGoFurther(){
    return true;
  }

  void readGetArguments(){
    survey = Get.arguments['survey'];
    questions = Get.arguments['questions'];
    responseModel = Get.arguments['responseModel'];
    groupsIds = Get.arguments['groups'];
    triggerableSectionActivationsCounts = Get.arguments['triggerableSectionActivationsCounts'];
  }
}

enum QuestionNavigationMode{
  off, top
}