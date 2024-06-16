import 'package:json_annotation/json_annotation.dart';
import 'package:survey_frontend/domain/models/create_selected_option_dto.dart';

part 'create_question_answer_dto.g.dart';

@JsonSerializable()
class CreateQuestionAnswerDto{
  String questionId;
  final List<CreateSelectedOptionDto>? selectedOptions;
  int? numericAnswer;

  CreateQuestionAnswerDto({required this.questionId, this.selectedOptions, this.numericAnswer});

  factory CreateQuestionAnswerDto.fromJson(Map<String, dynamic> json) => _$CreateQuestionAnswerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateQuestionAnswerDtoToJson(this);
}