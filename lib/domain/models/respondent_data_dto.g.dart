// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respondent_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RespondentDataDto _$RespondentDataDtoFromJson(Map<String, dynamic> json) =>
    RespondentDataDto(
      json['id'] as String,
      json['identityUserId'] as String,
      json['gender'] as String,
      json['ageCategoryId'] as int,
      json['occupationCategoryId'] as int,
      json['educationCategoryId'] as int,
      json['greeneryAreaCategoryId'] as int,
      json['medicationUseCategoryId'] as int,
      json['healthConditionCategoryId'] as int,
      json['stressLevelCategoryId'] as int,
      json['lifeSatisfactionCategoryId'] as int,
      json['qualityOfSleepCategoryId'] as int,
    );

Map<String, dynamic> _$RespondentDataDtoToJson(RespondentDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identityUserId': instance.identityUserId,
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
