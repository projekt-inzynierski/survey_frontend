import 'package:json_annotation/json_annotation.dart';

part 'occupation_category_dto.g.dart';

@JsonSerializable()
class OccupationCategoryDto{
  final int id;
  final String display;
  final int rowVersion;

  OccupationCategoryDto({required this.id, required this.display, required this.rowVersion});

  factory OccupationCategoryDto.fromJson(Map<String, dynamic> json) => _$OccupationCategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OccupationCategoryDtoToJson(this);
}