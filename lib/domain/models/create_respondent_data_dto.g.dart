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
      medicationUseCategoryId: json['medicationUseCategoryId'] as int?,
      healthConditionCategoryId: json['healthConditionCategoryId'] as int?,
      stressLevelCategoryId: json['stressLevelCategoryId'] as int?,
      lifeSatisfactionCategoryId: json['lifeSatisfactionCategoryId'] as int?,
      qualityOfSleepCategoryId: json['qualityOfSleepCategoryId'] as int?,
    );

Map<String, dynamic> _$CreateRespondentDataDtoToJson(
        CreateRespondentDataDto instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'ageCategoryId': instance.ageCategoryId,
      'occupationCategoryId': instance.occupationCategoryId,
      'educationCategoryId': instance.educationCategoryId,
      'greeneryAreaCategoryId': instance.greeneryAreaCategoryId,
      'medicationUseCategoryId': instance.medicationUseCategoryId,
      'healthConditionCategoryId': instance.healthConditionCategoryId,
      'stressLevelCategoryId': instance.stressLevelCategoryId,
      'lifeSatisfactionCategoryId': instance.lifeSatisfactionCategoryId,
      'qualityOfSleepCategoryId': instance.qualityOfSleepCategoryId,
    };
