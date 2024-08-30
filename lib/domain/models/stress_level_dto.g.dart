// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stress_level_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StressLevelDto _$StressLevelDtoFromJson(Map<String, dynamic> json) =>
    StressLevelDto(
      id: (json['id'] as num).toInt(),
      display: json['display'] as String,
      rowVersion: (json['rowVersion'] as num).toInt(),
    );

Map<String, dynamic> _$StressLevelDtoToJson(StressLevelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
