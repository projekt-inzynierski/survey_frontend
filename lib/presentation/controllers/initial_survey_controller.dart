import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InitialSurveyController extends ControllerBase{
  late int questionIndexFrom;
  late int questionIndexTo;
  late RxList<InitialSurveyQuestion> questions;
  bool get isLastStartSurveyScreen => questionIndexTo == questions.length - 1;

  

  void next(){
    if (isLastStartSurveyScreen){
      submit();
    }
    else{
      furtherQuestions();
    }
  }

  void submit(){

  }

  void furtherQuestions(){

  }

  void loadGetArguments(){
    questionIndexFrom = Get.arguments['questionIndexFrom'];
    questionIndexTo = Get.arguments['questionIndexTo'];
    questions = Get.arguments['questions'];
  }
}