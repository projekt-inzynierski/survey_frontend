import 'package:json_annotation/json_annotation.dart';

part 'medication_use_dto.g.dart';

@JsonSerializable()
class MedcationUseDto{
  final int id;
  final String display;
  final int rowVersion;

  MedcationUseDto({required this.id, required this.display, required this.rowVersion});

  factory MedcationUseDto.fromJson(Map<String, dynamic> json) => _$MedcationUseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MedcationUseDtoToJson(this);
}