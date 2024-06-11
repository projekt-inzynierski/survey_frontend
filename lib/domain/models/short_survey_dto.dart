import 'package:json_annotation/json_annotation.dart';

part 'short_survey_dto.g.dart';

@JsonSerializable()
class ShortSurveyDto {
  final String id;
  final String name;

  ShortSurveyDto({
    required this.id,
    required this.name,
  });

  factory ShortSurveyDto.fromJson(Map<String, dynamic> json) =>
      _$ShortSurveyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ShortSurveyDtoToJson(this);
}
