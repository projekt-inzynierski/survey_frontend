import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_frontend/domain/models/create_question_answer_dto.dart';
import 'package:survey_frontend/l10n/get_localizations.dart';

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
      decoration: InputDecoration(labelText: getAppLocalizations().enterNumber),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return getAppLocalizations().pleaseEnterNumber;
        }
        final number = int.tryParse(value);
        if (number == null) {
          return getAppLocalizations().pleaseEnterValidNumber;
        }
        if (number < 0) {
          return getAppLocalizations().pleaseEnterLeastZeroNumber;
        }
        if (number > 1000) {
          return getAppLocalizations().pleaseEnterNumberLessThan1000;
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
