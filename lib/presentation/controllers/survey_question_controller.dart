import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/screens/home/home_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_end_screen.dart';
import 'package:survey_frontend/presentation/screens/survey/survey_question_screen.dart';
import 'dart:convert';
import 'package:survey_frontend/presentation/screens/survey/widgets/option_type_question.dart';

class SurveyController extends ControllerBase {
  var questions = [].obs;
  var currentIndex = 0.obs;
  var surveyName = ''.obs;

  static const int questionTypeSingleChoice = 0;
  static const int questionTypeMultipleChoice = 1;

  SurveyController() {
    _loadQuestionsFromAsset();
  }

  Future<void> _loadQuestionsFromAsset() async {
    String jsonString = await rootBundle.loadString('assets/survey.json');
    _loadQuestions(jsonString);
  }

  void _loadQuestions(String jsonString) {
    final data = jsonDecode(jsonString);
    final sections = data['sections'];
    surveyName.value = data['survey']['name'];
    if (sections == null) {
      //TODO decide what to do if there are no sections
      throw Exception('No sections found in the survey');
    }
    for (var section in sections) {
      var sectionQuestions = section['questions'];
      if (sectionQuestions == null) {
        //TODO decide what to do if there are no questions
        throw Exception('No questions found in the section');
      }
      questions.addAll(sectionQuestions);
    }
  }

  Widget buildQuestion(Map<String, dynamic> question) {
    switch (question['question_type']) {
      case SurveyController.questionTypeSingleChoice:
        return OptionTypeQuestion(
            question: question, refresh: questions.refresh);
      default:
        //TODO go back to previous screen with error
        throw Exception(
            'Unsupported question type: ${question['question_type']}');
    }
  }

  void nextQuestion() {
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
      Get.back();
    }
  }

  Map<String, dynamic> getCurrentQuestion() {
    return questions.isNotEmpty ? questions[currentIndex.value] : {};
  }
}
