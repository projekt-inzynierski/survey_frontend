import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/create_question_answer_dto.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';

class TextSingleOptionTypeQuestion extends StatefulWidget {
  final Question question;
  final CreateSelectedOptionDto selectedOption;
  const TextSingleOptionTypeQuestion(
      {super.key,
      required this.question,
      required this.selectedOption});

  @override
  State<StatefulWidget> createState() {
    return _TextSingleOptionTypeQuestionState(question: question, selectedOption: selectedOption);
  }
}

class _TextSingleOptionTypeQuestionState
    extends State<TextSingleOptionTypeQuestion> {
  final Question question;
  final CreateSelectedOptionDto selectedOption;

  _TextSingleOptionTypeQuestionState(
      {required this.question, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.from(
        question.options!.map(
          (option) => RadioListTile(
            title: Text(option.label),
            value: option.id,
            groupValue: selectedOption.optionId,
            onChanged: (value) {
              setState(() {
                selectedOption.optionId = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
