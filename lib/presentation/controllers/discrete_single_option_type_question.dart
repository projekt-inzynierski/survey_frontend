import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';

class DiscreteSingleOptionTypeQuestion extends StatelessWidget {
  final Question question;
  final RxMap<String, String> answer;
  final Function refresh;
  const DiscreteSingleOptionTypeQuestion(
      {super.key,
      required this.question,
      required this.answer,
      required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.from(
        question.options!.map(
          (option) => RadioListTile(
            title: Text(option.label),
            value: option.id,
            groupValue: answer[question.id],
            onChanged: (value) {
              answer[question.id] = value.toString();
              refresh();
            },
          ),
        ),
      ),
    );
  }
}
