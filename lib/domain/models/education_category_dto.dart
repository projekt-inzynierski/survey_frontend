import 'package:json_annotation/json_annotation.dart';

part 'education_category_dto.g.dart';

@JsonSerializable()
class EducationCategoryDto{
  final int id;
  final String display;
  final int rowVersion;

  EducationCategoryDto({required this.id, required this.display, required this.rowVersion});

  factory EducationCategoryDto.fromJson(Map<String, dynamic> json) => _$EducationCategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EducationCategoryDtoToJson(this);
}