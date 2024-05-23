// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_satisfaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeSatisfactionDto _$LifeSatisfactionDtoFromJson(Map<String, dynamic> json) =>
    LifeSatisfactionDto(
      id: json['id'] as int,
      display: json['display'] as String,
      rowVersion: json['rowVersion'] as int,
    );

Map<String, dynamic> _$LifeSatisfactionDtoToJson(
        LifeSatisfactionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
