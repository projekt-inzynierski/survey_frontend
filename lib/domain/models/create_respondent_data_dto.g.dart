// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_respondent_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRespondentDataDto _$CreateRespondentDataDtoFromJson(
        Map<String, dynamic> json) =>
    CreateRespondentDataDto(
      gender: json['gender'] as String?,
      ageCategoryId: (json['ageCategoryId'] as num?)?.toInt(),
      occupationCategoryId: (json['occupationCategoryId'] as num?)?.toInt(),
      educationCategoryId: (json['educationCategoryId'] as num?)?.toInt(),
      greeneryAreaCategoryId: (json['greeneryAreaCategoryId'] as num?)?.toInt(),
      medicationUseId: (json['medicationUseId'] as num?)?.toInt(),
      healthConditionId: (json['healthConditionId'] as num?)?.toInt(),
      stressLevelId: (json['stressLevelId'] as num?)?.toInt(),
      lifeSatisfactionId: (json['lifeSatisfactionId'] as num?)?.toInt(),
      qualityOfSleepId: (json['qualityOfSleepId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateRespondentDataDtoToJson(
        CreateRespondentDataDto instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'ageCategoryId': instance.ageCategoryId,
      'occupationCategoryId': instance.occupationCategoryId,
      'educationCategoryId': instance.educationCategoryId,
      'greeneryAreaCategoryId': instance.greeneryAreaCategoryId,
      'medicationUseId': instance.medicationUseId,
      'healthConditionId': instance.healthConditionId,
      'stressLevelId': instance.stressLevelId,
      'lifeSatisfactionId': instance.lifeSatisfactionId,
      'qualityOfSleepId': instance.qualityOfSleepId,
    };
