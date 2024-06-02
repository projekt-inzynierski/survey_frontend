import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class SurveyQuestionController extends ControllerBase {
  var questions = [].obs;
  var currentIndex = 0.obs;
  var surveyName = ''.obs;

  static const int questionTypeSingleChoice = 0;
  static const int questionTypeMultipleChoice = 1;

  SurveyQuestionController() {
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
      //TODO go back to previous screen with error communicated
      throw Exception('No sections found in the survey');
    }
    for (var section in sections) {
      var sectionQuestions = section['questions'];
      if (sectionQuestions == null) {
        //TODO go back to previous screen with error communicated
        throw Exception('No questions found in the section');
      }
      questions.addAll(sectionQuestions);
    }
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
    }
  }

  void previousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  Map<String, dynamic> getCurrentQuestion() {
    return questions.isNotEmpty ? questions[currentIndex.value] : {};
  }
}
