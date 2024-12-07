// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationData _$LocalizationDataFromJson(Map<String, dynamic> json) =>
    LocalizationData(
      dateTime: json['dateTime'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocalizationDataToJson(LocalizationData instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
