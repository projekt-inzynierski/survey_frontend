import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/domain/models/question_type.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/discrete_single_option_type_question.dart';
import 'package:survey_frontend/presentation/controllers/question_navigatable_controller.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/text_single_option_type_question.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SurveyQuestionController extends QuestionNavigatableController{
  final SurveyService _surveyService;
  @override
  late SurveyDto survey;
  var surveyName = ''.obs;
  RxMap<String, String> answer = <String, String>{}.obs;
  var answeredQuestionIndexStack = <int>[].obs;
  var showSection = <int>[].obs;
  Question get question => questions[questionIndex].question;

  SurveyQuestionController(this._surveyService);

  Widget buildQuestionFromType(Question question) {
    switch (question.questionType) {
      case QuestionType.singleChoiceText:
        return TextSingleOptionTypeQuestion(
            question: question, selectedOption: responseModel.answers[questionIndex].selectedOptions![0],
            triggerableSectionActivationsCounts: triggerableSectionActivationsCounts);
      case QuestionType.singleChoiceDiscreteNumber:
        return DiscreteSingleOptionTypeQuestion(
            dto: responseModel.answers[questionIndex],
            from: question.numberRange!.from,
            to: question.numberRange!.to,
            fromLabel: question.numberRange!.fromLabel,
            toLabel: question.numberRange!.toLabel);
      default:
        //TODO decide what to do in this case (most likely skip this question)
        throw Exception(
            'Unsupported question type: ${question.questionType}');
    }
  }

  @override
  void readGetArguments(){
    super.readGetArguments();
    questionIndex = Get.arguments['questionIndex'];
  }

  @override
  bool canGoFurther(){
    //TODO: REMEMBER ABOUT OTHER QUESTION TYPES IN THE FUTURE
    if (question.questionType == QuestionType.singleChoiceDiscreteNumber){
      if (responseModel.answers[questionIndex].numericAnswer == null){
        popup("", AppLocalizations.of(Get.context!)!.selectOneOption);
        return false;
      }

      return true; 
    }

    if (responseModel.answers[questionIndex].selectedOptions![0].optionId == null){
      popup("", AppLocalizations.of(Get.context!)!.selectOneOption);
        return false;
    }

    return true;
  }
}