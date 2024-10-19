import 'package:flutter/material.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/domain/models/initial_survey_response.dart';

class InitialSurveyQuestionWidget extends StatefulWidget{
  final InitialSurveyQuestionResponse questionResponse;
  final List<InitialSurveyOption> possibleOptions;

  const InitialSurveyQuestionWidget({super.key, required this.questionResponse,
  required this.possibleOptions});

  @override
  State<StatefulWidget> createState() {
    return _InitialSurveyQuestionState();
  }

}

class _InitialSurveyQuestionState extends State<InitialSurveyQuestionWidget>{
  late InitialSurveyQuestionResponse questionResponse;
  late List<InitialSurveyOption> possibleOptions;

  _InitialSurveyQuestionState();

  @override
  void initState() {
    super.initState();
    questionResponse = widget.questionResponse;
    possibleOptions = widget.possibleOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.from(
        possibleOptions.map(
          (option) => RadioListTile(
            title: Text(option.content),
            value: option.id,
            groupValue: questionResponse.optionId,
            onChanged: (value) {
              setState(() {
                questionResponse.optionId = value;
              });
            },
          ),
        ),
      ),
    );
  }
}