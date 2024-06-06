// File path: lib/presentation/screens/survey_question_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/next_button.dart';

class SurveyQuestionScreen extends GetView<SurveyController> {
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
              Text(question.content),
              const SizedBox(height: 20),
              controller.buildQuestion(question),
              const Spacer(),
              NextButton(nextAction: controller.nextQuestion, text: 'Dalej'),
            ],
          );
        }),
      ),
    );
  }
}
