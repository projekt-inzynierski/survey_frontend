import 'package:flutter/material.dart';
import 'package:survey_frontend/domain/models/create_question_answer_dto.dart';

class DiscreteSingleOptionTypeQuestion extends StatefulWidget {
  final CreateQuestionAnswerDto dto;
  final int from;
  final int to;
  final String? fromLabel;
  final String? toLabel;
  const DiscreteSingleOptionTypeQuestion(
      {super.key,
      required this.dto,
      required this.from,
      required this.to,
      this.fromLabel,
      this.toLabel});

  @override
  State<StatefulWidget> createState() {
    return _DiscreteSingleOptionTypeQuestionState(
        dto: dto, from: from, to: to, fromLabel: fromLabel, toLabel: toLabel);
  }
}

class _DiscreteSingleOptionTypeQuestionState
    extends State<DiscreteSingleOptionTypeQuestion> {
  final CreateQuestionAnswerDto dto;
  final int from;
  final int to;
  final String? fromLabel;
  final String? toLabel;

  _DiscreteSingleOptionTypeQuestionState(
      {required this.dto,
      required this.from,
      required this.to,
      this.fromLabel,
      this.toLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fromLabel ?? ''),
            Text(toLabel ?? ''),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.generate(to - from + 1, (index) {
            final value = from + index;
            return Column(
              children: [
                Text(value.toString()),
                Radio(
                  value: value,
                  groupValue: dto.numericAnswer,
                  onChanged: (val) {
                    setState(() {
                      dto.numericAnswer = val;
                    });
                  },
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
