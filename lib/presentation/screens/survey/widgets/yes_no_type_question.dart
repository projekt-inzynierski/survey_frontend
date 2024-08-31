import 'package:flutter/material.dart';

class YesNoTypeQuestion extends StatefulWidget {
  final bool selectedOption;
  const YesNoTypeQuestion({super.key, required this.selectedOption});

  @override
  State<StatefulWidget> createState() {
    return _YesNoTypeQuestionState(selectedOption: selectedOption);
  }
}

class _YesNoTypeQuestionState extends State<YesNoTypeQuestion> {
  bool selectedOption;
  _YesNoTypeQuestionState({required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<bool>(
          value: true,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        Text("Tak"),
        Radio<bool>(
          value: false,
          groupValue: selectedOption,
          onChanged: (bool? value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        Text("Nie"),
      ],
    );
  }
}
