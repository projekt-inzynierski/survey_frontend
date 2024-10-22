import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/initial_survey_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_frontend/presentation/screens/initial_survey/widgets/initial_survey_question_widget.dart';

class InitialSurveyScreen extends GetView<InitialSurveyController>{
  final InitialSurveyController _controller;

  InitialSurveyScreen({super.key}) : _controller = Get.find();

  @override

 Widget build(BuildContext context) {
  _controller.loadGetArguments();
  return Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: _controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Expanded(
              child: ListView.builder(
                itemCount: _controller.questionIndexTo - _controller.questionIndexFrom + 1,
                itemBuilder: (context, index) {
                  final question = _controller.questions[_controller.questionIndexFrom + index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InitialSurveyQuestionWidget(
                      question: question.content,
                      possibleOptions: question.options,
                      questionResponse: _controller.responsesIdMappings[question.id]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.only(bottom: 50.0, left: 25, right: 25),
      child: ElevatedButton(
        onPressed: _controller.next,
        child: Text(AppLocalizations.of(context)!.next),
      ),
    ),
  );
}

}