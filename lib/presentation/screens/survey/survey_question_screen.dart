import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/question_navigatable_controller.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/next_button.dart';

class SurveyQuestionScreen extends GetView<SurveyQuestionController> {
  final SurveyQuestionController _controller;

  SurveyQuestionScreen({super.key}) : _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    _controller.readGetArguments();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'UrBEaT',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Obx(() => Text(
                      _controller.surveyName.value,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(height: 20),
              Text(
                'Pytanie ${_controller.questionIndex + 1}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(_controller.question.content),
              const SizedBox(height: 20),
              _controller.buildQuestionFromType(_controller.question),
              const Spacer(),
              NextButton(nextAction: (){
                _controller.navigateToNextQuestion(QuestionNavigationMode.top);
              }, text: 'Dalej'),
            ],),
      ),
    );
  }
}
