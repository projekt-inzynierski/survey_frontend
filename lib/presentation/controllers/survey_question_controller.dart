import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/question_type.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/discrete_single_option_type_question.dart';
import 'package:survey_frontend/presentation/controllers/question_navigable_controller.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/number_input_type_question.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/text_multiple_choice_type_question.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/text_single_choice_type_question.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/yes_no_type_question.dart';

class SurveyQuestionController extends QuestionNavigableController {
  RxMap<String, String> answer = <String, String>{}.obs;
  var answeredQuestionIndexStack = <int>[].obs;
  var showSection = <int>[].obs;
  Question get question => questions[questionIndex].question;

  SurveyQuestionController();

  Widget buildQuestionFromType(Question question) {
    switch (question.questionType) {
      case QuestionType.singleChoiceText:
        return TextSingleChoiceTypeQuestion(
            question: question,
            selectedOption:
                responseModel.answers[questionIndex].selectedOptions![0],
            triggerableSectionActivationsCounts:
                triggerableSectionActivationsCounts);
      case QuestionType.singleChoiceLinearScale:
        return DiscreteSingleOptionTypeQuestion(
            dto: responseModel.answers[questionIndex],
            from: question.numberRange!.from,
            to: question.numberRange!.to,
            fromLabel: question.numberRange!.fromLabel,
            toLabel: question.numberRange!.toLabel);
      case QuestionType.yesNo:
        return YesNoTypeQuestion(
            createQuestionAnswerDto: responseModel.answers[questionIndex]);
      case QuestionType.multipleChoiceText:
        return TextMultipleChoiceTypeQuestion(
            question: question,
            selectedOptions:
                responseModel.answers[questionIndex].selectedOptions!,
            triggerableSectionActivationsCounts:
                triggerableSectionActivationsCounts);
      case QuestionType.numberInput:
        return NumberInputTypeQuestion(
            dto: responseModel.answers[questionIndex]);
      default:
        //TODO decide what to do in this case (most likely skip this question)
        throw Exception('Unsupported question type: ${question.questionType}');
    }
  }

  @override
  void readGetArguments() {
    super.readGetArguments();
    questionIndex = Get.arguments['questionIndex'];
  }

  @override
  bool canGoFurther() {
    //TODO: REMEMBER ABOUT OTHER QUESTION TYPES IN THE FUTURE
    if (question.questionType == QuestionType.singleChoiceLinearScale) {
      if (responseModel.answers[questionIndex].numericAnswer == null) {
        popup("", AppLocalizations.of(Get.context!)!.selectOneOption);
        return false;
      }

      return true;
    }

    if (question.questionType == QuestionType.yesNo) {
      if (responseModel.answers[questionIndex].yesNoAnswer == null) {
        popup("", AppLocalizations.of(Get.context!)!.selectOneOption);
        return false;
      }

      return true;
    }
    if (question.questionType == QuestionType.singleChoiceText) {
      if (responseModel.answers[questionIndex].selectedOptions![0].optionId ==
          null) {
        popup("", AppLocalizations.of(Get.context!)!.selectOneOption);
        return false;
      }
    }
    if (question.questionType == QuestionType.numberInput) {
      var number = responseModel.answers[questionIndex].numericAnswer;
      if (number == null || number < 0 || number > 1000) {
        return false;
      }
      return true;
    }

    return true;
  }
}

class NumericInputTypeQuestion {}
