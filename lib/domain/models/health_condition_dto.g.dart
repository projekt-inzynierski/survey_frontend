// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_condition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthConditionDto _$HealthConditionDtoFromJson(Map<String, dynamic> json) =>
    HealthConditionDto(
      id: (json['id'] as num).toInt(),
      display: json['display'] as String,
      rowVersion: (json['rowVersion'] as num).toInt(),
    );

Map<String, dynamic> _$HealthConditionDtoToJson(HealthConditionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
