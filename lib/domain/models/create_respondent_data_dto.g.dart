// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_respondent_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRespondentDataDto _$CreateRespondentDataDtoFromJson(
        Map<String, dynamic> json) =>
    CreateRespondentDataDto(
      gender: json['gender'] as String?,
      ageCategoryId: json['ageCategoryId'] as int?,
      occupationCategoryId: json['occupationCategoryId'] as int?,
      educationCategoryId: json['educationCategoryId'] as int?,
      greeneryAreaCategoryId: json['greeneryAreaCategoryId'] as int?,
      medicationUseId: json['medicationUseId'] as int?,
      healthConditionId: json['healthConditionId'] as int?,
      stressLevelId: json['stressLevelId'] as int?,
      lifeSatisfactionId: json['lifeSatisfactionId'] as int?,
      qualityOfSleepId: json['qualityOfSleepId'] as int?,
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
