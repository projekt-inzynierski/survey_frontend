// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupation_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccupationCategoryDto _$OccupationCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    OccupationCategoryDto(
      id: json['id'] as int,
      display: json['display'] as String,
      rowVersion: json['rowVersion'] as int,
    );

Map<String, dynamic> _$OccupationCategoryDtoToJson(
        OccupationCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
