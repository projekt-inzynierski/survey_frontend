// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_survey_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortSurveyDto _$ShortSurveyDtoFromJson(Map<String, dynamic> json) =>
    ShortSurveyDto(
      id: json['id'] as String,
      name: json['name'] as String,
      dates: (json['dates'] as List<dynamic>)
          .map((e) => TimeSlotDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShortSurveyDtoToJson(ShortSurveyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dates': instance.dates,
    };
