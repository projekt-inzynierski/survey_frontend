import 'package:json_annotation/json_annotation.dart';
import 'package:survey_frontend/domain/models/create_question_answer_dto.dart';

part 'create_survey_response_dto.g.dart';

@JsonSerializable()
class CreateSurveyResponseDto{
  final String surveyId;
  final List<CreateQuestionAnswerDto> answers;

  CreateSurveyResponseDto({required this.surveyId, required this.answers});

  factory CreateSurveyResponseDto.fromJson(Map<String, dynamic> json) => _$CreateSurveyResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateSurveyResponseDtoToJson(this);
}