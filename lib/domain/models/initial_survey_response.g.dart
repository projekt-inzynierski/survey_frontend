// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitialSurveyResponse _$InitialSurveyResponseFromJson(
        Map<String, dynamic> json) =>
    InitialSurveyResponse(
      questionResponses: (json['questionResponses'] as List<dynamic>)
          .map((e) =>
              InitialSurveyQuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InitialSurveyResponseToJson(
        InitialSurveyResponse instance) =>
    <String, dynamic>{
      'questionResponses': instance.questionResponses,
    };

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
