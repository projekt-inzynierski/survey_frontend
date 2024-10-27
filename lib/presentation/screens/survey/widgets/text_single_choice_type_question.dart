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
    return _TextSingleChoiceTypeQuestionState();
  }
}

class _TextSingleChoiceTypeQuestionState
    extends State<TextSingleChoiceTypeQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.from(
        widget.question.options!.map(
          (option) => RadioListTile(
            title: Text(option.label),
            value: option.id,
            groupValue: widget.selectedOption.optionId,
            onChanged: (value) {
              setState(() {
                Option? currentOption =
                    widget.question.options!.firstWhereOrNull(
                  (element) => element.id == widget.selectedOption.optionId,
                );
                if (currentOption != null &&
                    currentOption.showSection != null) {
                  widget.triggerableSectionActivationsCounts[
                          currentOption.showSection!] =
                      widget.triggerableSectionActivationsCounts[
                              currentOption.showSection!]! -
                          1;
                }

                widget.selectedOption.optionId = value;

                currentOption = widget.question.options!.firstWhereOrNull(
                  (element) => element.id == widget.selectedOption.optionId,
                );
                if (currentOption != null &&
                    currentOption.showSection != null) {
                  widget.triggerableSectionActivationsCounts[
                          currentOption.showSection!] =
                      widget.triggerableSectionActivationsCounts[
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
