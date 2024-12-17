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
    return _DiscreteSingleOptionTypeQuestionState();
  }
}

class _DiscreteSingleOptionTypeQuestionState
    extends State<DiscreteSingleOptionTypeQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.fromLabel ?? ''),
        ...List<Widget>.generate(widget.to - widget.from + 1, (index) {
          final value = widget.from + index;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value.toString()),
              Radio(
                value: value,
                groupValue: widget.dto.numericAnswer,
                onChanged: (val) {
                  setState(() {
                    widget.dto.numericAnswer = val;
                  });
                },
              ),
            ],
          );
        }),
        Text(widget.toLabel ?? ''),
      ],
    );
  }
}
