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
    final numberRange = question.numberRange!;
    final from = numberRange.from;
    final to = numberRange.to;
    final fromLabel = numberRange.fromLabel ?? 'low';
    final toLabel = numberRange.toLabel ?? 'high';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fromLabel),
            Text(toLabel),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.generate(to - from + 1, (index) {
            final value = (from + index).toString();
            return Column(
              children: [
                Text(value),
                Radio(
                  value: value,
                  groupValue: answer[question.id],
                  onChanged: (dynamic value) {
                    answer[question.id] = value.toString();
                    refresh();
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
