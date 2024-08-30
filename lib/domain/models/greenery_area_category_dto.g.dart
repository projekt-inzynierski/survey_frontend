// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greenery_area_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GreeneryAreaCategoryDto _$GreeneryAreaCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    GreeneryAreaCategoryDto(
      id: (json['id'] as num).toInt(),
      display: json['display'] as String,
      rowVersion: (json['rowVersion'] as num).toInt(),
    );

Map<String, dynamic> _$GreeneryAreaCategoryDtoToJson(
        GreeneryAreaCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
