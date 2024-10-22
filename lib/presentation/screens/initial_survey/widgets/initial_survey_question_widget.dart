import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/domain/models/initial_survey_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InitialSurveyQuestionWidget extends StatefulWidget{
  final String question;
  final InitialSurveyQuestionResponse questionResponse;
  final List<InitialSurveyOption> possibleOptions;

  const InitialSurveyQuestionWidget({super.key, 
  required this.question,
  required this.questionResponse,
  required this.possibleOptions});

  @override
  State<StatefulWidget> createState() {
    return _InitialSurveyQuestionState();
  }

}

class _InitialSurveyQuestionState extends State<InitialSurveyQuestionWidget>{
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<InitialSurveyOption>(
              validator: validateNotEmpty,
              decoration: InputDecoration(
                  labelText: widget.question),
              isExpanded: true,
              value: widget.questionResponse.optionId == null ? null : widget.possibleOptions.firstWhere((element) => element.id == widget.questionResponse.optionId),
              items: widget.possibleOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.content),
                      ))
                  .toList(),
              onChanged: (value) {
               widget.questionResponse.optionId = value?.id;
              });
  }

  String? validateNotEmpty(InitialSurveyOption? value){
    if (value == null){
      return AppLocalizations.of(Get.context!)!.valueNotEmpty;
    }
    return null;
  }
}