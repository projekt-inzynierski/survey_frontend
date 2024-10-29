import 'package:flutter/material.dart';
import 'package:survey_frontend/domain/models/create_selected_option_dto.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';

class TextMultipleChoiceTypeQuestion extends StatefulWidget {
  final Question question;
  final List<CreateSelectedOptionDto> selectedOptions;
  final Map<int, int> triggerableSectionActivationsCounts;
  const TextMultipleChoiceTypeQuestion(
      {super.key,
      required this.question,
      required this.selectedOptions,
      required this.triggerableSectionActivationsCounts});

  @override
  State<StatefulWidget> createState() {
    return _TextMultipleChoiceTypeQuestion();
  }
}

class _TextMultipleChoiceTypeQuestion
    extends State<TextMultipleChoiceTypeQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.from(
        widget.question.options!.map(
          (option) => CheckboxListTile(
            title: Text(option.label),
            value: widget.selectedOptions
                .any((selectedOption) => selectedOption.optionId == option.id),
            onChanged: (bool? isChecked) {
              setState(() {
                if (isChecked == true) {
                  widget.selectedOptions
                      .add(CreateSelectedOptionDto(optionId: option.id));

                  if (option.showSection != null) {
                    widget.triggerableSectionActivationsCounts[
                            option.showSection!] =
                        widget.triggerableSectionActivationsCounts[
                                option.showSection!]! +
                            1;
                  }
                } else {
                  widget.selectedOptions.removeWhere(
                      (selectedOption) => selectedOption.optionId == option.id);

                  if (option.showSection != null) {
                    widget.triggerableSectionActivationsCounts[
                            option.showSection!] =
                        widget.triggerableSectionActivationsCounts[
                                option.showSection!]! -
                            1;
                  }
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
