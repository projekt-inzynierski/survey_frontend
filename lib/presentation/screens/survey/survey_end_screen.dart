import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/next_button.dart';

class SurveyEndScreen extends GetView<SurveyController> {
  const SurveyEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Czy na pewno chcesz zakończyć ankietę?\nNie będziesz mógł potem edytować odpowiedzi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              NextButton(
                nextAction: controller.endSurvey,
                text: 'Zakończ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
