// File path: lib/presentation/screens/survey_question_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';

class SurveyQuestionScreen extends GetView<SurveyQuestionController> {
  const SurveyQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'UrBEaT',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.previousQuestion();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final question = controller.getCurrentQuestion();
          if (question.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Obx(() => Text(
                      controller.surveyName.value,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(height: 20),
              Text(
                'Pytanie ${controller.currentIndex.value + 1}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(question['content']),
              const SizedBox(height: 20),
              _buildQuestion(question),
              const Spacer(),
              _buildNextButton(),
            ],
          );
        }),
      ),
    );
  }

  _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          controller.nextQuestion();
        },
        child: const Text('Dalej'),
      ),
    );
  }

  _buildQuestion(Map<String, dynamic> question) {
    switch (question['question_type']) {
      case SurveyQuestionController.questionTypeSingleChoice:
        return _buildOptionType(question);

      default:
        //TODO go back to previous screen with error
        throw Exception(
            'Unsupported question type: ${question['question_type']}');
    }
  }

  _buildOptionType(Map<String, dynamic> question) {
    return Column(
      children: List<Widget>.from(
        question['options'].map(
          (option) => RadioListTile(
            title: Text(option['label']),
            value: option['id'],
            groupValue: question['selectedOption'],
            onChanged: (value) {
              question['selectedOption'] = value;
              controller.questions.refresh();
            },
          ),
        ),
      ),
    );
  }
}
