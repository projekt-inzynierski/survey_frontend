import 'package:json_annotation/json_annotation.dart';

part 'survey_participation_dto.g.dart';

@JsonSerializable()
class SurveyParticipationDto {
  String id;
  String respondentId;
  String surveyId;
  String date;
  int rowVersion;

  SurveyParticipationDto(
      {required this.id,
      required this.respondentId,
      required this.surveyId,
      required this.date,
      required this.rowVersion});

  factory SurveyParticipationDto.fromJson(Map<String, dynamic> json) =>
      _$SurveyParticipationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyParticipationDtoToJson(this);
}
