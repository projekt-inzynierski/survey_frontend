// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgeCategoryDto _$AgeCategoryDtoFromJson(Map<String, dynamic> json) =>
    AgeCategoryDto(
      id: json['id'] as int,
      display: json['display'] as String,
      rowVersion: json['rowVersion'] as int,
    );

Map<String, dynamic> _$AgeCategoryDtoToJson(AgeCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
