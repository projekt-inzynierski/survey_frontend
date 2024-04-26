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
      json['medicationUseId'] as int,
      json['healthConditionId'] as int,
      json['stressLevelId'] as int,
      json['lifeSatisfactionId'] as int,
      json['qualityOfSleepId'] as int,
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
      'medicationUseId': instance.medicationUseId,
      'healthConditionId': instance.healthConditionId,
      'stressLevelId': instance.stressLevelId,
      'lifeSatisfactionId': instance.lifeSatisfactionId,
      'qualityOfSleepId': instance.qualityOfSleepId,
    };
