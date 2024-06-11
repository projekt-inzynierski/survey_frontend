import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/controllers/discrete_single_option_type_question.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_end_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_question_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/text_single_option_type_question.dart';

class SurveyController extends ControllerBase {
  final SurveyService _surveyService;
  late SurveyDto survey;
  var questions = [].obs;
  var currentIndex = 0.obs;
  var surveyName = ''.obs;
  RxMap<String, String> answer = <String, String>{}.obs;

  SurveyController(this._surveyService) {
    _loadSurvey();
  }

  Future<void> _loadSurvey() async {
    APIResponse<SurveyDto> response =
        await _surveyService.getSurvey(Get.arguments['surveyID']);
    if (response.error != null || response.body == null) {
      await handleSomethingWentWrong(null);
      return;
    }
    survey = response.body!;
    _loadQuestions(survey);
  }

  void _loadQuestions(SurveyDto surveyObj) {
    final sections = surveyObj.sections;
    surveyName.value = surveyObj.name;
    for (var section in sections) {
      var sectionQuestions = section.questions;
      questions.addAll(sectionQuestions);
    }
  }

  Widget buildQuestionFromType(Question question) {
    switch (question.questionType) {
      case QuestionType.singleChoiceText:
        return TextSingleOptionTypeQuestion(
            question: question, answer: answer, refresh: questions.refresh);
      case QuestionType.singleChoiceDiscreteNumber:
        return DiscreteSingleOptionTypeQuestion(
            question: question, answer: answer, refresh: questions.refresh);
      default:
        //TODO go back to previous screen with error
        throw Exception(
            'Unsupported question type: ${question.questionType}');
    }
  }

  void nextQuestion() {
    if (answer[questions[currentIndex.value].id] == null) {
      Get.defaultDialog(
          title: "Error",
          middleText: "Please provide an answer",
          confirm: const Text("Ok"));
      return;
    }

    if (currentIndex.value < questions.length - 1) {
      
      currentIndex.value++;
      Get.to(
        () => const SurveyQuestionScreen(),
        transition: Transition.noTransition,
      );
    } else {
      Get.to(
        () => const SurveyEndScreen(),
        transition: Transition.noTransition,
      );
    }
  }

  void startSurvey() {
    currentIndex.value = 0;
    Get.to(
      () => const SurveyQuestionScreen(),
      transition: Transition.noTransition,
    );
  }

  void endSurvey() {
    Get.offAllNamed(
      "/home",
    );
  }

  void previousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    } else {
      Get.back();
    }
  }

  Question getCurrentQuestion() {
    return questions.isNotEmpty ? questions[currentIndex.value] : {};
  }
}


class QuestionType {
  static const String singleChoiceText = "single_text_selection";
  static const String singleChoiceDiscreteNumber = "discrete_number_selection";
}
