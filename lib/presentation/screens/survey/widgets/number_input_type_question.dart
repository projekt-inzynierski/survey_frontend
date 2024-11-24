import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_frontend/domain/models/create_question_answer_dto.dart';

class NumberInputTypeQuestion extends StatefulWidget {
  final CreateQuestionAnswerDto dto;
  const NumberInputTypeQuestion({super.key, required this.dto});

  @override
  State<StatefulWidget> createState() {
    return _NumberInputTypeQuestion();
  }
}

class _NumberInputTypeQuestion extends State<NumberInputTypeQuestion> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: 'Enter a number',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        final number = int.tryParse(value);
        if (number == null) {
          return 'Please enter a valid number';
        }
        if (number < 0) {
          return 'Please enter a positive number';
        }
        if (number > 1000) {
          return 'Please enter a number less than 1000';
        }
        return null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) {
        setState(() {
          widget.dto.numericAnswer = int.tryParse(value) ?? 0;
        });
      },
    );
  }
}
