import 'package:json_annotation/json_annotation.dart';
import 'package:survey_frontend/domain/models/time_slot_dto.dart';

part 'short_survey_dto.g.dart';

  @JsonSerializable()
class ShortSurveyDto {
  final String id;
  final String name;
  final List<TimeSlotDto> dates;

  ShortSurveyDto({
    required this.id,
    required this.name,
    required this.dates
  });

  factory ShortSurveyDto.fromJson(Map<String, dynamic> json) =>
      _$ShortSurveyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ShortSurveyDtoToJson(this);
}
