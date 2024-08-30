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
      (json['ageCategoryId'] as num).toInt(),
      (json['occupationCategoryId'] as num).toInt(),
      (json['educationCategoryId'] as num).toInt(),
      (json['greeneryAreaCategoryId'] as num).toInt(),
      (json['medicationUseId'] as num).toInt(),
      (json['healthConditionId'] as num).toInt(),
      (json['stressLevelId'] as num).toInt(),
      (json['lifeSatisfactionId'] as num).toInt(),
      (json['qualityOfSleepId'] as num).toInt(),
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
