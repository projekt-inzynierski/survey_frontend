// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationCategoryDto _$EducationCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    EducationCategoryDto(
      id: (json['id'] as num).toInt(),
      display: json['display'] as String,
      rowVersion: (json['rowVersion'] as num).toInt(),
    );

Map<String, dynamic> _$EducationCategoryDtoToJson(
        EducationCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
