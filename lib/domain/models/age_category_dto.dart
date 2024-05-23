import 'package:json_annotation/json_annotation.dart';

part 'age_category_dto.g.dart';

@JsonSerializable()
class AgeCategoryDto{
  final int id;
  final String display;
  final int rowVersion;

  AgeCategoryDto({required this.id, required this.display, required this.rowVersion});

  factory AgeCategoryDto.fromJson(Map<String, dynamic> json) => _$AgeCategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AgeCategoryDtoToJson(this);
}