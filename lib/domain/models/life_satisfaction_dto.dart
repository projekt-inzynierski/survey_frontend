import 'package:json_annotation/json_annotation.dart';

part 'life_satisfaction_dto.g.dart';

@JsonSerializable()
class LifeSatisfactionDto{
  final int id;
  final String display;
  final int rowVersion;

  LifeSatisfactionDto({required this.id, required this.display, required this.rowVersion});

  factory LifeSatisfactionDto.fromJson(Map<String, dynamic> json) => _$LifeSatisfactionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LifeSatisfactionDtoToJson(this);
}