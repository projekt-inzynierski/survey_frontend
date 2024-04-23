// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_use_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedcationUseDto _$MedcationUseDtoFromJson(Map<String, dynamic> json) =>
    MedcationUseDto(
      id: json['id'] as int,
      display: json['display'] as String,
      rowVersion: json['rowVersion'] as int,
    );

Map<String, dynamic> _$MedcationUseDtoToJson(MedcationUseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'rowVersion': instance.rowVersion,
    };
