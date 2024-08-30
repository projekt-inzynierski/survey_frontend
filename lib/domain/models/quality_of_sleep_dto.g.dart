// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quality_of_sleep_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QualityOfSleepDto _$QualityOfSleepDtoFromJson(Map<String, dynamic> json) =>
    QualityOfSleepDto(
      id: (json['id'] as num).toInt(),
      display: json['display'] as String,
      rowVersion: (json['rowVersion'] as num).toInt(),
    );

Map<String, dynamic> _$QualityOfSleepDtoToJson(QualityOfSleepDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
