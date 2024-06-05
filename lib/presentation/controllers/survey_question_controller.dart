import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/screens/home/home_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_end_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_question_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/option_type_question.dart';

class SurveyController extends ControllerBase {
  final SurveyService _surveyService;
  var survey = <SurveyDto>[].obs;
  var questions = [].obs;
  var currentIndex = 0.obs;
  var surveyName = ''.obs;
  RxMap<String, String> answer = <String, String>{}.obs;

  static const String questionTypeSingleChoice = "single_text_selection";
  static const String questionTypeMultipleChoice = "discrete_number_selection";

  SurveyController(this._surveyService) {
    _loadSurvey();
  }

  Future<void> _loadSurvey() async {
    APIResponse<List<SurveyDto>> response = await _surveyService.getSurvey();
    if (response.error == null && response.body != null) {
      survey.value = response.body!;
      _loadQuestions(survey[0]);
    } else {
      await handleSomethingWentWrong(null);
      return;
    }
  }

  // Future<void> _loadQuestionsFromAsset() async {
  //   String jsonString =
  //       await rootBundle.loadString('assets/mocked/survey.json');
  //   _loadQuestions(jsonString);
  // }

  void _loadQuestions(SurveyDto surveyObj) {
    final sections = surveyObj.sections;
    surveyName.value = surveyObj.name;
    for (var section in sections) {
      var sectionQuestions = section.questions;
      questions.addAll(sectionQuestions);
    }
  }

  Widget buildQuestion(Question question) {
    switch (question.questionType) {
      case SurveyController.questionTypeSingleChoice:
        return OptionTypeQuestion(
            question: question, answer: answer, refresh: questions.refresh);
      default:
        //TODO go back to previous screen with error
        throw Exception(
            'Unsupported question type: ${question.questionType}');
    }
  }

  void nextQuestion() {
    if (answer.isEmpty) {
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
    Get.offAll(
      () => const HomeScreen(),
      transition: Transition.noTransition,
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
