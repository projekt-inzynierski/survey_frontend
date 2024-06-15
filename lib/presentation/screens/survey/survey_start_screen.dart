import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/question_navigatable_controller.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';
import 'package:survey_frontend/presentation/screens/survey/widgets/next_button.dart';

class SurveyStartScreen extends GetView<QuestionNavigatableController> {
  const SurveyStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getSurveyFromGetArgument();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Center(
              child: Text(
                'Czy chcesz rozpocząć wypełnianie ankiety?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            const Spacer(),
            NextButton(nextAction: (){
              controller.navigateToNextQuestion(QuestionNavigationMode.off);
            }, 
            text: "Rozpocznij"),
          ],
        ),
      ),
    );
  }
}
