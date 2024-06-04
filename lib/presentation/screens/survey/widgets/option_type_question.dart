import 'package:flutter/material.dart';

class OptionTypeQuestion extends StatelessWidget {
  final Map<String, dynamic> question;
  final Function refresh;
  const OptionTypeQuestion(
      {super.key, required this.question, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.from(
        question['options'].map(
          (option) => RadioListTile(
            title: Text(option['label']),
            value: option['id'],
            groupValue: question['answer'],
            onChanged: (value) {
              question['answer'] = value;
              refresh();
            },
          ),
        ),
      ),
    );
  }
}
