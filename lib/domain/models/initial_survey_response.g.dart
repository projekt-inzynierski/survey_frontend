// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitialSurveyQuestionResponse _$InitialSurveyQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    InitialSurveyQuestionResponse(
      questionId: json['questionId'] as String,
      optionId: json['optionId'] as String?,
    );

Map<String, dynamic> _$InitialSurveyQuestionResponseToJson(
        InitialSurveyQuestionResponse instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'optionId': instance.optionId,
    };
