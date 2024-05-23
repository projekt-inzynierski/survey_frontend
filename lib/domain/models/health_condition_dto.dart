import 'package:json_annotation/json_annotation.dart';

part 'health_condition_dto.g.dart';

@JsonSerializable()
class HealthConditionDto{
  final int id;
  final String display;
  final int rowVersion;

  HealthConditionDto({required this.id, required this.display, required this.rowVersion});

  factory HealthConditionDto.fromJson(Map<String, dynamic> json) => _$HealthConditionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HealthConditionDtoToJson(this);
}