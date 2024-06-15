class CreateQuestionAnswerDto{
  final List<CreateSelectedOptionDto>? selectedOptions;
  int? numericAnswer;

  CreateQuestionAnswerDto({this.selectedOptions, this.numericAnswer});
}

class CreateSelectedOptionDto{
  String? optionId;

  CreateSelectedOptionDto({this.optionId});
}