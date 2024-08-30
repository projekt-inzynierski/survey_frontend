// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_use_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationUseDto _$MedicationUseDtoFromJson(Map<String, dynamic> json) =>
    MedicationUseDto(
      id: (json['id'] as num).toInt(),
      display: json['display'] as String,
      rowVersion: (json['rowVersion'] as num).toInt(),
    );

Map<String, dynamic> _$MedicationUseDtoToJson(MedicationUseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
