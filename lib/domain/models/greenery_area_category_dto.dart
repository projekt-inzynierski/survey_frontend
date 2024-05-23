import 'package:json_annotation/json_annotation.dart';

part 'greenery_area_category_dto.g.dart';

@JsonSerializable()
class GreeneryAreaCategoryDto{
  final int id;
  final String display;
  final int rowVersion;

  GreeneryAreaCategoryDto({required this.id, required this.display, required this.rowVersion});

  factory GreeneryAreaCategoryDto.fromJson(Map<String, dynamic> json) => _$GreeneryAreaCategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GreeneryAreaCategoryDtoToJson(this);
}