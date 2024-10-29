// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotDto _$TimeSlotDtoFromJson(Map<String, dynamic> json) => TimeSlotDto(
      id: json['id'] as String,
      start: DateTime.parse(json['start'] as String),
      finish: DateTime.parse(json['finish'] as String),
      rowVersion: (json['rowVersion'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TimeSlotDtoToJson(TimeSlotDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.toIso8601String(),
      'finish': instance.finish.toIso8601String(),
      'rowVersion': instance.rowVersion,
    };
