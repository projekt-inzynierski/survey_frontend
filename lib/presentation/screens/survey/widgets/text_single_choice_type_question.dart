import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/create_selected_option_dto.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';

class TextSingleChoiceTypeQuestion extends StatefulWidget {
  final Question question;
  final CreateSelectedOptionDto selectedOption;
  final Map<int, int> triggerableSectionActivationsCounts;
  const TextSingleChoiceTypeQuestion(
      {super.key,
      required this.question,
      required this.selectedOption,
      required this.triggerableSectionActivationsCounts});

  @override
  State<StatefulWidget> createState() {
    return _TextSingleChoiceTypeQuestionState(
        question: question,
        selectedOption: selectedOption,
        triggerableSectionActivationsCounts:
            triggerableSectionActivationsCounts);
  }
}

class _TextSingleChoiceTypeQuestionState
    extends State<TextSingleChoiceTypeQuestion> {
  final Question question;
  final CreateSelectedOptionDto selectedOption;
  final Map<int, int> triggerableSectionActivationsCounts;

  _TextSingleChoiceTypeQuestionState(
      {required this.question,
      required this.selectedOption,
      required this.triggerableSectionActivationsCounts});

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
                Option? currentOption = question.options!.firstWhereOrNull(
                  (element) => element.id == selectedOption.optionId,
                );
                if (currentOption != null &&
                    currentOption.showSection != null) {
                  triggerableSectionActivationsCounts[currentOption
                      .showSection!] = triggerableSectionActivationsCounts[
                          currentOption.showSection!]! -
                      1;
                }

                selectedOption.optionId = value;

                currentOption = question.options!.firstWhereOrNull(
                  (element) => element.id == selectedOption.optionId,
                );
                if (currentOption != null &&
                    currentOption.showSection != null) {
                  triggerableSectionActivationsCounts[currentOption
                      .showSection!] = triggerableSectionActivationsCounts[
                          currentOption.showSection!]! +
                      1;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
