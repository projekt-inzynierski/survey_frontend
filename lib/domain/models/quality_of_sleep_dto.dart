import 'package:json_annotation/json_annotation.dart';

part 'quality_of_sleep_dto.g.dart';

@JsonSerializable()
class QualityOfSleepDto{
  final int id;
  final String display;
  final int rowVersion;

  QualityOfSleepDto({required this.id, required this.display, required this.rowVersion});

  factory QualityOfSleepDto.fromJson(Map<String, dynamic> json) => _$QualityOfSleepDtoFromJson(json);
  Map<String, dynamic> toJson() => _$QualityOfSleepDtoToJson(this);
}