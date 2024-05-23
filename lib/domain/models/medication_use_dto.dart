import 'package:json_annotation/json_annotation.dart';

part 'medication_use_dto.g.dart';

@JsonSerializable()
class MedicationUseDto{
  final int id;
  final String display;
  final int rowVersion;

  MedicationUseDto({required this.id, required this.display, required this.rowVersion});

  factory MedicationUseDto.fromJson(Map<String, dynamic> json) => _$MedicationUseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationUseDtoToJson(this);
}